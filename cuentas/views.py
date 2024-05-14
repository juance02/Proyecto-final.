
from base64 import urlsafe_b64decode
from email import message
from urllib import request
from django.contrib import messages, auth
from multiprocessing import context
from django.shortcuts import render ,redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib.sites.shortcuts import get_current_site
from django.template.loader import render_to_string
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.contrib.auth.tokens import default_token_generator
from django.utils.encoding import force_bytes
from django.core.mail import EmailMessage
from django.core.mail import send_mail
from django.conf import settings

from productos.models import *

from cuentas.models import *

from .forms import *
from ordenes_de_compra.models import *

from carrito.views import _carrito_id
from carrito.models import *
import requests

# Create your views here.

def registrar(request):
    form = registrarseForm
    if request.method == 'POST':
        form = registrarseForm(request.POST)
        if form.is_valid():
            nombres = form.cleaned_data['nombres']
            apellidos = form.cleaned_data['apellidos']
            numero_telefono = form.cleaned_data['numero_telefono']
            email = form.cleaned_data['email']
            password = form.cleaned_data['password']

            #
            nombreusuario = email.split("@")[0] 
            user = Cuentas.objects.create_user(nombres=nombres, apellidos=apellidos, email=email, nombreusuario=nombreusuario, password=password )
            user.numero_telefono = numero_telefono
            #messages.success(request,  'Su registro con exito ')
            # cuando user se guarda me genera una id 
            user.save() 


            perfil = UserPerfil()
            # con esta funcion esta generando un record un tabla userperfil ,
            #  y cuando el user.save genera la id la obtengo y puedo usarlo y 
            # enlazarlo con la tabla del perfil 
            perfil.user_id = user.id
            perfil.image_perfil = 'perfiles/perfil.jfif'
            perfil.save()

            current_site = get_current_site(request)
            mail_subject = 'Por favor activa tu cuenta en Tierra de Grandes'
            body = render_to_string('registracion/verificacion_email.html', {
                'user': user,
                'domain': current_site,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                'token': default_token_generator.make_token(user),
            })
            to_email = email
            send_email = EmailMessage(mail_subject, body, to=[to_email])
            send_email.send()

            return redirect('/login/?command=verification&email='+email)

    context = {
        'form': form
    }
    return render(request, 'registracion/register.html' ,context)

def login(request):
    if request.method == 'POST':
        email = request.POST['email']
        password = request.POST['password']

        user = auth.authenticate(email=email, password=password)

        if user is not None:
            try:
                carrito = Carrito.objects.get(carrito_id=_carrito_id(request))
                is_carrito_item_exist = CarritoItem.objects.filter(carrito=carrito).exists()
                if is_carrito_item_exist:
                    carrito_item = CarritoItem.objects.filter(carrito=carrito)

                    productos_kardex = []
                    for item in carrito_item:
                        kardex = item.kardexob.all()
                        productos_kardex.append(list(kardex))

                    carrito_item = CarritoItem.objects.filter(user=user)
                    ex_var_list = []
                    id= []
                    for item in carrito_item:
                        existing_kardex = item.kardexob.all()
                        ex_var_list.append(list(existing_kardex))
                        id.append(item.id)

                    #productos_kardex  = [,3,41,2,5]
                    # ex_var_list = [5, 6, 7, ,8]

                    for pr in productos_kardex:
                        if pr in ex_var_list:
                            index = ex_var_list.index(pr)
                            item_id = id[index]
                            item = CarritoItem.objects.get(id=item_id)
                            item.candidad +=1
                            item.user = user
                            item.save()
                        else:
                            carrito_item = CarritoItem.objects.filter(carrito=carrito)
                            for item in carrito_item:
                                item.user = user
                                item.save()

                    
            except:
                pass
            #http://127.0.0.1:8000/login/?next=/checkout
            auth.login(request, user)
            messages.success(request, 'Has iniciado sesion Exitosamente')
            url =request.META.get('HTTP_REFERER')
            try:
                query = requests.utils.urlparse(url).query
                #?next=/checkout
                params = dict(x.split('=') for x in query.split('&'))
                if 'next' in params:
                    nextPage = params['next']
                    return redirect(nextPage)
            except:

                return redirect('tablero')
        
        else:
            messages.error(request, 'la información no es correcta')
            return redirect('login')

    return render(request, 'registracion/Login1.html')

@login_required(login_url='login')
def logout(request):
    auth.logout(request)
    messages.success(request,  'Has salido de session')

    return redirect('login')

def activate(request, uidb64, token):
    try:
        uid = urlsafe_base64_decode(uidb64).decode()
        user = Cuentas._default_manager.get(pk=uid)
    except(TypeError, ValueError, OverflowError, Cuentas.DoesNotExist):
        user = None

    if user is not None and default_token_generator.check_token(user, token):
        user.is_active = True
        user.save()
        messages.success(request, 'felicitaciones, tu cuenta esta activa!')
        return redirect('login')

    else:
        messages.error(request, 'La activacion es invalida')
        return redirect('registrar')

@login_required(login_url='login')
def tablero (request):
    orden = Orden.objects.order_by('-orden_creacion').filter(user_id =request.user.id, confirmacion_orden=True)
    orden_count = orden.count()

    context = {
        'orden_count':orden_count,
    }
    return render(request, 'registracion/tablero.html',context)

def passwordolvidada(request):
    if request.method == 'POST':
        email = request.POST['email']
        if Cuentas.objects.filter(email=email).exists():
            user = Cuentas.objects.get(email__exact=email)

            current_site = get_current_site(request)
            mail_subject = 'Resetear Contraseña'
            body = render_to_string('registracion/resetear_password_email.html',{
                'user': user,
                'domain': current_site,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                'token': default_token_generator.make_token(user),
            })
            to_email = email
            send_email = EmailMessage(mail_subject, body, to=[to_email])
            send_email.send()

            messages.success(request, 'Un correo fue enviado a tu bandeja de entrada para cambiar tu contraseña')
            return redirect('login')
        else:
            messages.error (request, 'La cuenta de usuario no existe')
            return redirect('passwordolvidada')

    return render (request, 'registracion/passwordolvidada.html')

def resetearpassword_validar(request, uidb64, token):
    try:
        uid = urlsafe_base64_decode(uidb64).decode()#-->para decodifique la uid ingresado como parametro 
        user = Cuentas._default_manager.get(pk=uid) #con esta linea de codigo voy a obtener el usuario desde url

    except(TypeError, ValueError, OverflowError, Cuentas.DoesNotExist): #> en esta linea se hace una exepcion si no encuentra los valores ;
        user = None

    if user is not None and default_token_generator.check_token(user, token):

        request.session['uid'] = uid
        messages.success(request, 'Por favor cambia tu contraseña')
        return redirect('resetearpassword')
    else:
        messages.error(request, 'El link ha expirado')
        return redirect('login')

def resetearpassword(request):
    if request.method == 'POST':
        password = request.POST['password']
        confirm_password = request.POST['confirm_password']
        if password == confirm_password:
            uid = request.session.get('uid')
            user = Cuentas.objects.get(pk=uid)
            user.set_password(password)
            user.save()
            messages.success(request, 'La contraseña se cambio correctamente')
            return redirect('login')
        else:
            messages.error(request, 'La contraseña no concuerda')
            return redirect('resetearpassword')
    else:
        return render (request, 'registracion/resetearpassword.html')

    return render()
@login_required
def perfil (request, nombreusuario=None):
    current_user = request.user
    if nombreusuario and nombreusuario !=current_user.nombreusuario:
        user = Cuentas.objects.get(nombreusuario=nombreusuario)
        product = user.product.all()

    else:
        product = current_user.product.all()
        user = current_user

    return render(request, 'perfil/perfil.html',{'user':user, 'product':product})

@login_required
def perfilusuario(request, nombres=None):
    current_user = request.user
    if nombres and nombres !=current_user.nombres:
        user = Cuentas.objects.get(nombres=nombres)
        product = user.product.all()

    else:
        product = current_user.product.all()
        user = current_user

    return render(request, 'perfil/perfilusu.html',{'user':user, 'product':product})


def edit_perfil(request):
    userperfil = get_object_or_404(UserPerfil, user=request.user)
    if request.method == 'POST':
        user_form = UserForm(request.POST, instance=request.user)
        perfil_form = UsuarioPerfilForm(request.POST, request.FILES , instance=userperfil)
        if user_form.is_valid() and user_form.is_valid():
            user_form.save()
            perfil_form.save()
            messages.success(request, 'su informacion fue guardada con exito')
            return redirect ('perfil')

    else:
        user_form = UserForm(instance=request.user)
        perfil_form = UsuarioPerfilForm(instance=userperfil)
    
    context = {
        'user_form': user_form,
        'perfil_form' : perfil_form,
        'userperfil': userperfil,

    }

    return render (request , 'perfil/edit_perfil.html' ,  context)


def mas_informacion (request,nombreusuario):
    user_form = Cuentas.objects.filter(nombreusuario=nombreusuario)
    

    context = {
        'user_form' : user_form,
        #'perfil_form': perfil_form
    }

    return render (request, 'perfil/mas_informacion.html', context)

def contactar(request):
    if request.method == "POST":
        asunto = request.POST["txtAsunto"]
        descripcion = request.POST["textmsg"] + "/ Email: " + request.POST["txtEmail"]
        email_desde = settings.EMAIL_HOST_USER
        email_para = ["tierradegrandes2022@gmail.com"]
        send_mail(asunto,descripcion,email_desde,email_para,  fail_silently=False)
        
        return render(request,"contacto/contactoExitoso.html")
    return render(request,"contacto/contact.html")



def mis_ordenes (request):
    orden = Orden.objects.filter(user=request.user, confirmacion_orden=True).order_by('-orden_creacion')
    context = {
        'orden':orden,
    }
    return render(request, 'registracion/mis_ordenes.html', context)
    
def mis_productos (request):
    producto = Producto.objects.filter(user=request.user).order_by('-fecha_creacion')
    context = {
        'producto':producto,
    }
    return render(request, 'productos_usuario.html', context)





    


    
