from itertools import product
from multiprocessing import context
from django.http import HttpResponseRedirect, JsonResponse
from django.shortcuts import render,redirect
from django.urls import reverse_lazy
from carrito.models import *
from .models import *
from productos.forms import OrdenForm
from productos.forms import *
from ordenes_de_compra.models import *
import datetime
import json
from django.core.mail import EmailMessage
from django.template.loader import render_to_string

from django.http import HttpResponse
from django.views.generic import View

import os
from django.conf import settings
from django.http import HttpResponse
from django.template.loader import get_template
from xhtml2pdf import pisa
from django.contrib.staticfiles import finders




# Create your views here.

def pagos (request):
    body = json.loads(request.body)
    orden = Orden.objects.get(user=request.user, confirmacion_orden=False, orden_numero=body['ordenID'])

    pago = Pago(
        user = request.user,
        pagos_id = body['transID'],
        payment_method = body['payment_method'],
        monto_id = orden.orden_total,
        status = body['status'],
    )
    pago.save()

    orden.pago = pago
    orden.confirmacion_orden = True
    orden.save()

    #mover todos los carritos utems hacia la tabla orden producto 
    carrito_items = CarritoItem.objects.filter(user=request.user)#todos los elementos filtrados por el usuario 


    for item in carrito_items:
        ordenproductos = OrdenProducto()#hacemos una instacia hacia el modelo ordenproducto
        ordenproductos.orden_id = orden.id
        ordenproductos.pagos = pago
        ordenproductos.user_id = request.user.id
        ordenproductos.productos_id = item.productos.id
        ordenproductos.cantidad = item.cantidad
        ordenproductos.precio = item.productos.precio
        ordenproductos.ordenado = True
        ordenproductos.save()

        carrito_item = CarritoItem.objects.get(id=item.id)
        productos_kardex = carrito_item.kardexob.all()
        ordenproductos = OrdenProducto.objects.get(id=ordenproductos.id)
        ordenproductos.kardex.set(productos_kardex)
        ordenproductos.save()

        productos = Producto.objects.get(id=item.productos_id)
        productos.stock -= item.cantidad #
        productos.save()

    CarritoItem.objects.filter(user=request.user).delete()

    mail_subject = 'Gracias por ordenar productos en Tierra de Grandes '
    body = render_to_string('ordenes/orden_de_compra_email.html', {
        'user': request.user,
        'orden':orden,
    })

    to_email = request.user.email #para quien va a enviar el correo 
    send_email = EmailMessage(mail_subject, body, to=[to_email])
    send_email.send()

    data = {
        'orden_numero': orden.orden_numero,
        'transID':  pago.pagos_id,
    }


    return JsonResponse(data)

def ordenar (request, total=0, cantidad=0):
    current_user = request.user
    carrito_items = CarritoItem.objects.filter(user=current_user)
    carrito_count = carrito_items.count()

    if carrito_count <= 0:
        return redirect('inicio')# si el carrito de compras esta en cero cuando realizo la compra me manda al inicio 

    total_final = 0
    inpuesto = 0

    for carrito_item in carrito_items:
        total += (carrito_item.productos.precio * carrito_item.cantidad)
        cantidad += carrito_item.cantidad

    inpuesto = (2 * total)/100
    total_final = total + inpuesto

    if request.method == 'POST':
        form = OrdenForm(request.POST)

        if form.is_valid():
            data = Orden()
            data.user = current_user
            data.nombres = form.cleaned_data ["nombres"]
            data.apellidos = form.cleaned_data['apellidos']
            data.numero_telefono = form.cleaned_data['numero_telefono']
            data.email = form.cleaned_data['email']
            data.direccion_linea_1 = form.cleaned_data['direccion_linea_1']
            data.direccion_linea_2 = form.cleaned_data['direccion_linea_2']
            data.departamento = form.cleaned_data['departamento']
            data.ciudad = form.cleaned_data['ciudad']
            data.orden_descripcion  = form.cleaned_data['orden_descripcion']
            data.orden_total = total_final
            data.inpuesto = inpuesto
            data.ip = request.META.get('REMOTE_ADDR')
            data.save()
            yr=int(datetime.date.today().strftime('%Y'))
            mt=int(datetime.date.today().strftime('%m'))
            dt=int(datetime.date.today().strftime('%d'))
            d = datetime.date(yr,mt,dt)
            current_date = d.strftime("%Y%m%d")
            # con esta funcion impreme la fecha 20220501 que me sirve para mi orden de compra,
            # o mi numero de orden de compra

            orden_numero = current_date + str(data.id) 
            data.orden_numero = orden_numero
            data.save()


            orden = Orden.objects.get(user=current_user, confirmacion_orden=False, orden_numero=orden_numero)
            context={
                'orden':orden,
                'carrito_items':carrito_items,
                'total':total,
                'inpuesto':inpuesto,
                'total_final':total_final,

            }

            #return redirect('checkout')
            return render(request,'ordenes/pagos.html' ,context)
    
    else:
        return redirect('checkout')



def orden_completada (request):
    orden_numero = request.GET.get('orden_numero')
    transID = request.GET.get('pagos_id')
    
    try:
        orden = Orden.objects.get(orden_numero=orden_numero,confirmacion_orden=True)
        ordenado = OrdenProducto.objects.filter(orden_id=orden.id)

        subtotal = 0
        for i in ordenado:
            subtotal += i.precio*i.cantidad

        pago = Pago.objects.get(pagos_id=transID)

        context = {
            'orden': orden,
            'ordenado': ordenado,
            'orden_numero': orden.orden_numero,
            'transID': pago.pagos_id,
            'pago': pago,
            'subtotal':subtotal,
        }
        return render(request, 'ordenes/orden_completada.html', context)
    except (Pago.DoesNotExist, Orden.DoesNotExist):
        return redirect('inicio')
        
def pdf3(request, orden_numero):
    
    factura = Orden.objects.filter(orden_numero=orden_numero)
    orden = Orden.objects.get(orden_numero=orden_numero,confirmacion_orden=True)
    ordenado = OrdenProducto.objects.filter(orden_id=orden.id)
   
    subtotal = 0
    for i in ordenado:
            subtotal += i.precio*i.cantidad
    template = get_template('ordenes/factura3.html')
    context = {
        'factura': factura,
        'ordenado': ordenado,
        'subtotal':subtotal,
        
        }
    html = template.render(context)
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = 'attachment; filename="Mi_Factura.pdf"'
    
    pisa_status = pisa.CreatePDF(
            html, dest=response)
            # if error then show some funny view
    if pisa_status.err:
                return HttpResponse('We had some errors <pre>' + html + '</pre>')
    return response


    
       
            
        
        








    
