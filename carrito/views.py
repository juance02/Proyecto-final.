from contextlib import redirect_stderr
from gc import get_objects
from itertools import product
from multiprocessing import context
from urllib import request
from django.shortcuts import render, redirect, get_object_or_404
from productos.models import *
from carrito.models import *
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth.decorators import login_required

# Create your views here.
def _carrito_id(request): #creamos una funcion privada que solo va a funcionar en este archivo
    carrito =request.session.session_key
    if not carrito: #hago una condicion que si no exiate
                    #el carrito en la session del usuario genere uno nuevo 
        carrito = request.session.create()
    return carrito
      
def add_carrito (request,pk):
    productos = Producto.objects.get(pk=pk)#se hace la consulta al producto agregar 

    current_user = request.user

    if current_user.is_authenticated:
        #aqui en este bloque agregaremos la logica del carrito de compras cuando
        #el usuario esta autenticado 
        productos_kardex = []

        if request.method == 'POST':
            for item in request.POST:
                key = item
                value = request.POST[key]

                try:
                    kardex = Kardex.objects.get(productos=productos, kardex_categoria__iexact=key, kardex_value__iexact=value)
                    productos_kardex.append(kardex)
                except:
                    pass

        is_carrito_item_exists = CarritoItem.objects.filter(productos=productos, user=current_user).exists()


        if is_carrito_item_exists:
            carrito_item = CarritoItem.objects.filter(productos=productos, user=current_user)

            ex_var_list = []
            id = []
            for item in carrito_item:
                existing_kardex = item.kardexob.all()
                ex_var_list.append(list(existing_kardex))
                id.append(item.id)

            if productos_kardex in ex_var_list:
                index = ex_var_list.index(productos_kardex)
                item_id = id[index]
                item = CarritoItem.objects.get(productos=productos, id=item_id)
                item.cantidad +=1
                item.save()
            else:
                item = CarritoItem.objects.create(productos=productos, cantidad=1, user=current_user)
                if len(productos_kardex) > 0 :
                    item.kardexob.clear()
                    item.kardexob.add(*productos_kardex)
                item.save()
        else:
            carrito_item = CarritoItem.objects.create(
                productos = productos,
                cantidad = 1,
                user = current_user,
            ) 
            if len(productos_kardex) > 0 :
                carrito_item.kardexob.clear()
                carrito_item.kardexob.add(*productos_kardex)
            carrito_item.save()
        return redirect('carrito')

    else:   
        productos_kardex = []

        if request.method == 'POST':
            for item in request.POST:
                key = item
                value = request.POST[key]

                try :
                    kardex = Kardex.objects.get(productos=productos, kardex_categoria__iexact=key, kardex_value__iexact=value)
                    productos_kardex.append(kardex)
                except:
                    pass

        try:
            carrito = Carrito.objects.get(carrito_id=_carrito_id(request))
        except Carrito.DoesNotExist:
            carrito = Carrito.objects.create(
                carrito_id = _carrito_id(request)
            )
        carrito.save()

        is_carrito_item_exists = CarritoItem.objects.filter(productos=productos, carrito = carrito).exists()


        if is_carrito_item_exists:
            carrito_item = CarritoItem.objects.filter(productos=productos,carrito=carrito)

            ex_var_list = []
            id = []
            for item in carrito_item:
                existing_kardex = item.kardexob.all()
                ex_var_list.append(list(existing_kardex))
                id.append(item.id)

            if productos_kardex in ex_var_list:
                index = ex_var_list.index(productos_kardex)
                item_id = id[index]
                item = CarritoItem.objects.get(productos=productos, id=item_id)
                item.cantidad +=1
                item.save()
            else:
                item = CarritoItem.objects.create(productos=productos, cantidad=1, carrito=carrito)
                if len(productos_kardex) > 0 :
                    item.kardexob.clear()
                    item.kardexob.add(*productos_kardex)
                item.save()
        else:
            carrito_item = CarritoItem.objects.create(
                productos = productos,
                cantidad = 1,
                carrito = carrito,
            ) 
            if len(productos_kardex) > 0 :
                carrito_item.kardexob.clear()
                carrito_item.kardexob.add(*productos_kardex)
            carrito_item.save()
        return redirect('carrito')

def remove_carrito(request, pk, carrito_item_id):
    
    productos = get_object_or_404(Producto, pk=pk)
    try:
        if request.user.is_authenticated:
            carrito_item = CarritoItem.objects.get(productos=productos, user=request.user, id=carrito_item_id)

        else:
            carrito = Carrito.objects.get(carrito_id =_carrito_id(request))
            carrito_item = CarritoItem.objects.get(productos=productos, carrito=carrito, id=carrito_item_id)
        if carrito_item.cantidad>1:
            carrito_item.cantidad -= 1
            carrito_item.save()
        else:
            carrito_item.delete()
    except:
        pass
    return redirect('carrito')


def eliminar_carrito_item (request, pk, carrito_item_id):
    productos = get_object_or_404(Producto, pk=pk)
    if request.user.is_authenticated:
        carrito_item = CarritoItem.objects.get(productos=productos, user=request.user, id=carrito_item_id)
    else:    
        carrito = Carrito.objects.get(carrito_id=_carrito_id(request))
    
        carrito_item = CarritoItem.objects.get(productos=productos, carrito=carrito, id=carrito_item_id)
    carrito_item.delete()
    return redirect('carrito')


def carrito (request, total=0, cantidad=0, carrito_items=None):
    inpuesto = 0
    total_final = 0
    try:
        if request.user.is_authenticated:
            carrito_items = CarritoItem.objects.filter(user=request.user, activo=True)
        else:
            carrito = Carrito.objects.get(carrito_id=_carrito_id(request))
            carrito_items = CarritoItem.objects.filter(carrito=carrito, activo=True )
        for carrito_item in carrito_items:
            total += (carrito_item.productos.precio * carrito_item.cantidad)
            cantidad += carrito_item.cantidad
        inpuesto = (2*total)/100
        total_final = total + inpuesto
    except ObjectDoesNotExist:
        pass ## ignora la exepcion

    context = {
        'total':total,
        'cantidad':cantidad,
        'carrito_items':carrito_items,
        'inpuesto':inpuesto,
        'total_final':total_final,

    }


    return render(request, 'producto/carrito.html', context)
@login_required(login_url='login')
def checkout (request, total=0, cantidad=0, carrito_items=None):
    inpuesto = 0
    total_final = 0
    try:
        if request.user.is_authenticated:
            carrito_items = CarritoItem.objects.filter(user=request.user, activo=True)
        else:
            carrito = Carrito.objects.get(carrito_id=_carrito_id(request))
            carrito_items = CarritoItem.objects.filter(carrito=carrito, activo=True )

        for carrito_item in carrito_items:
            total += (carrito_item.productos.precio * carrito_item.cantidad)
            cantidad += carrito_item.cantidad
        inpuesto = (1*total)/100
        total_final = total + inpuesto
    except ObjectDoesNotExist:
        pass ## ignora la exepcion

    context = {
        'total':total,
        'cantidad':cantidad,
        'carrito_items':carrito_items,
        'inpuesto':inpuesto,
        'total_final':total_final,

    }


    return render(request, 'producto/checkout.html', context)




