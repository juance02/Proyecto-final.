
from django.shortcuts import render, get_object_or_404, redirect
from productos.models import *
from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
from tiera_de_grandes.forms import formsp


# Create your views here.

def inicio (request,categoria_slug=None):
    categorias =None
    productos =None

    if categoria_slug !=None:
        categorias = get_object_or_404(Categoria, slug=categoria_slug)
        productos = Producto.objects.filter(categoria=categorias, activo=True)
        paginator = Paginator(productos, 12)
        page = request.GET.get('page')
        page_productos = paginator.get_page(page)
        product_count = productos.count()

    else:
        productos = Producto.objects.all().filter(activo=True)
        paginator = Paginator(productos, 12)
        page = request.GET.get('page')
        page_productos = paginator.get_page(page)
        product_count = productos.count()

    context = {
        'productos' :page_productos, 
        'product_count':product_count,
        
    }
   

    return render(request, 'index.html',context)




def formm (request):

    if request.method == 'POST':
        form = formsp(data=request.POST, files=request.FILES)
        if form.is_valid():
            form.save()
            return redirect ('inicio')
    else:
        form = formsp()

    context = {
        'form':form
    }
    return render(request, 'formulariop.html',context)
    



