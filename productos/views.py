from multiprocessing import context
from django.shortcuts import render, get_object_or_404, redirect
from .models import *
from cuentas.models import *
from categorias.models import *
from carrito.models import *
from carrito.views import _carrito_id
from django.contrib import messages
from django.db.models import Q
from .forms import *
from django.contrib.auth.decorators import  login_required
from cuentas.models import *
from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
from ordenes_de_compra.models import OrdenProducto


# Create your views here.

def verproducto (request, categoria_slug=None):
    categorias =None
    productos =None

    if categoria_slug !=None:
        categorias = get_object_or_404(Categoria, slug=categoria_slug)
        productos = Producto.objects.filter(categoria=categorias, activo=True)
        paginator = Paginator(productos, 5)
        page = request.GET.get('page')
        page_productos = paginator.get_page(page)
        product_count = productos.count()

    else:
        productos = Producto.objects.all().filter(activo=True)
        paginator = Paginator(productos, 5)
        page = request.GET.get('page')
        page_productos = paginator.get_page(page)
        product_count = productos.count()

    context = {
        'productos' :page_productos, 
        'product_count':product_count,
        
    }

    return render (request, 'categorias/vercategoria.html',context)


def detalleproducto(request, categoria_slug, producto_slug):
    try:
        single_producto = Producto.objects.get(categoria__slug=categoria_slug, slug=producto_slug)
        in_carrito = CarritoItem.objects.filter(carrito__carrito_id=_carrito_id(request), productos=single_producto).exists()

    except Exception as e:
        raise e
    if request.user.is_authenticated:

        try: 
            ordenproducto = OrdenProducto.objects.filter(user=request.user, productos=single_producto.id ).exists()

        except OrdenProducto.DoesNotExist:
            ordenproducto = None
    else:
        ordenproducto = None 

    comentarios = RevisionCalificacion.objects.filter(producto_id=single_producto.id, estado=True)

    context = {
        'single_producto': single_producto,
        'in_carrito':in_carrito,
        'ordenproducto':ordenproducto,
        'comentarios': comentarios,
    }    
    return render(request, 'verproducts/verproductos.html', context) 

def buscador(request):
    if 'keyword' in request.GET:
        keyword = request.GET['keyword']
        if keyword:
            productos = Producto.objects.order_by('-fecha_creacion').filter(Q(descripcion__icontains=keyword) | Q(nombre__icontains=keyword))
            producto_count = productos.count()

    context = {
        'productos':productos,
        'producto_count':producto_count,
    }
    return render(request, 'categorias/vercategoria.html' ,context)

@login_required
def agregar_Producto(request):
    current_user = get_object_or_404(Cuentas, pk=request.user.pk)

    if request.method == 'POST':
        formulario = ProductoForm(data=request.POST, files=request.FILES)
        if formulario.is_valid():
            producto = formulario.save(commit=False)
            producto.user = current_user
            producto.save()
            messages.success(request, 'producto cargado')
            return redirect ('inicio')

    else:
        formulario = ProductoForm()

    return render(request, 'producto/agregarproducto.html', {'formulario' : formulario})
@login_required
def listar_productos(request):
    productos = Producto.objects.all()
    data ={
        'productos': productos
    }
    return render(request, 'producto/listar.html', data)

def modificar_producto(request,pk):
    
    producto = get_object_or_404(Producto, pk=pk)

    data = {
        'form': ProductoForm(instance=producto)
    }
    if request.method == 'POST':
        form = ProductoForm(data=request.POST, instance=producto, files=request.FILES)
        if form.is_valid():
            form.save()
            messages.success(request, 'Producto Modificado con Exito')
            return redirect("tablero")

        data["form"] = form    
    return render(request, 'producto/modificar.html', data)


def eliminar_producto(request, pk):
    producto = get_object_or_404(Producto, pk=pk)
    producto.delete()
    messages.success(request, 'Producto Eliminado con Exito')
    return redirect(to="tablero")


def verificar(request):
    return render(request, 'producto/verificar.html')




"""def productos (request):
    product = Producto.objects.all().filter(activo = True)

    context = {
        'product': product,
    }
    return render (request, 'productos.html', context)"""



def productos_usuario (request):
    product = Producto.objects.all().filter(activo = True)

    context = {
        'product': product,
    }
    return render (request, 'productos.html', context)
 

def verproducto_usuario (request, pk):
    verproducto = Producto.objects.filter(pk=pk)

    context={
        'verproducto':verproducto,
    }
    return render(request, 'verproducts/verproductos_usuario.html', context) 

def comentarios_calf (request, producto_id):
    url = request.META.get('HTTP_REFERER')
    if request.method == 'POST':
        try:
            comentarios = RevisionCalificacion.objects.get(user__id=request.user.id, producto__id=producto_id)
            form = comentarioform(request.POST, instance=comentarios)
            form.save()
            messages.success(request, 'Muchas Gracias! Tu comentario ha sido cargado')
            return redirect(url)
        except RevisionCalificacion .DoesNotExist:
            form = comentarioform(request.POST)
            if form.is_valid():
                data = RevisionCalificacion()
                data.Sujeto = form.cleaned_data['Sujeto']    
                data.calificacion= form.cleaned_data['calificacion']    
                data.comentario = form.cleaned_data['comentario']    
                data.ip = request.META.get('REMOTE_ADDR')   
                data.producto_id = producto_id     
                data.user_id = request.user.id     
                data.save()
                messages.success(request, 'Muchas Gracias! Tu comentario fue enviado con exito')
                return redirect(url) 





