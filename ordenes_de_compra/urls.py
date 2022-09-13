from django.urls import path
from . import views
from ordenes_de_compra.views import *

urlpatterns=[
    path('ordenar/', views.ordenar, name='ordenar'),
    path('pagos/', views.pagos, name='pagos'),
    path('orden_completada/', views.orden_completada, name='orden_completada'),
    path('PDF/<int:pk>/', views.PDF.as_view(), name='PDF'),
    
]