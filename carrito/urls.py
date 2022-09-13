from django.urls import path
from . import views
from carrito.views import *


urlpatterns = [
    path('carrito/', views.carrito, name='carrito'),
    path('add_carrito/<int:pk>/', views.add_carrito, name='add_carrito'),
    path('remove_carrito/<int:pk>/<int:carrito_item_id>/', views.remove_carrito, name='remove_carrito'),
    path('eliminar_carrito_item/<int:pk>/<int:carrito_item_id>/', views.eliminar_carrito_item, name='eliminar_carrito_item'),
    path('checkout/', views.checkout, name='checkout'),
    
    

]