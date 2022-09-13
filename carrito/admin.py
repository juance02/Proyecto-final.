from django.contrib import admin
from.models import *

# Register your models here.
class carritoAdmin (admin.ModelAdmin):
    list_display = ('carrito_id', 'date_creacion' )

class carritoitemAdmin(admin.ModelAdmin):
    list_display = ('productos', 'carrito', 'cantidad', 'activo')

admin.site.register(Carrito, carritoAdmin)
admin.site.register(CarritoItem , carritoitemAdmin)
