from django.urls import path
from . import views
from productos.views import *


urlpatterns = [
    path('verproducto/', verproducto, name='verproducto'),
    path('categoria/<slug:categoria_slug>/', views.verproducto, name='productos_categoria'),
    path('verproducto_usuario/<int:pk>/', views.verproducto_usuario, name='verproducto_usuario'),
    path('categoria/<slug:categoria_slug>/<slug:producto_slug>/', views.detalleproducto, name='detalleproducto'),
    path('buscador/', views.buscador, name='buscador'),
    path('agregar-producto/', views.agregar_Producto, name="agregar_producto"),
    path('listar_productos/', views.listar_productos, name="listar_productos"),
    path('modificar_producto/<int:pk>/', modificar_producto, name="modificar_producto"),
    path('eliminar_producto/<int:pk>/', eliminar_producto, name="eliminar_producto"),
    path('verificar/', views.verificar, name='verificar'),
    #path('productos/', views.productos, name='productos'),
    path('productos_usuario/', views.productos_usuario, name='productos_usuario'),
    path('comentarios_calf/<int:producto_id>/', views.comentarios_calf, name="comentarios_calf"),
   
   


]