from django.contrib import admin
from ordenes_de_compra.models import Pago
from ordenes_de_compra.models import Orden
from ordenes_de_compra.models import OrdenProducto

# Register your models here.

class OrdenProductosInline(admin.TabularInline):
    model = OrdenProducto

    readonly_fields = ('pagos', 'user', 'productos', 'cantidad', 'precio','ordenado')
    extra = 0

class OrdenAdmin (admin.ModelAdmin):
    list_display = ['orden_numero', 'full_nombre', 'numero_telefono', 'email', 'ciudad', 'orden_total', 'inpuesto', 'confirmacion_orden', 'orden_creacion']
    list_filter = ['estado', 'confirmacion_orden']
    search_fields = ['orden_numero', 'nombres', 'apellidos', 'numero_telefono', 'email']
    list_per_page = 20
    inlines = [OrdenProductosInline]

admin.site.register(Pago)
admin.site.register(Orden, OrdenAdmin)
admin.site.register(OrdenProducto)


