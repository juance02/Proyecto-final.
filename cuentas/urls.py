from django.urls import path
from . import views 
from cuentas.views import *

urlpatterns = [
    path('registrar/', views.registrar, name='registrar'),
    path('login/', views.login, name='login'),
    path('logout/', views.logout, name='logout'),
    path ('tablero/', views.tablero, name='tablero'),  
    path ('passwordolvidada/', views.passwordolvidada, name='passwordolvidada'), 
    path ('resetearpassword_validar/<uidb64>/<token>/', views.resetearpassword_validar, name='resetearpassword_validar'), 
    path ('resetearpassword/', views.resetearpassword, name='resetearpassword'), 
    path('activate/<uidb64>/<token>/', views.activate, name='activate'),
    path('edit_perfil/', views.edit_perfil, name='edit_perfil'),
    path('perfil/', views.perfil, name='perfil'),
    path('perfil/<str:nombreusuario>/', views.perfil, name='perfil'),
    #path('perfilusuario/<str:nombres>/', views.perfilusuario, name='perfilusuario'),
    path('mas_informacion/<str:nombreusuario>/', views.mas_informacion, name='mas_informacion'),
    path('contactar/', views.contactar,name="contactar"),
    path ('mis_ordenes/', views.mis_ordenes, name='mis_ordenes'),  
    path ('mis_productos/', views.mis_productos, name='mis_productos'),  
]