from django.contrib import admin
from .models import *
# Register your models here.

class productoadmin(admin.ModelAdmin):
    list_display = ('nombre', 'precio', 'stock', 'categoria', 'modificacion_date', 'activo')


class KardexAdmin (admin.ModelAdmin):
    list_display = ('producto', 'kardex_categoria', 'kardex_value', 'activo')
    list_editable = ('activo',)
    list_filter= ('producto', 'kardex_categoria', 'kardex_value', 'activo')
    


admin.site.register(Producto, productoadmin)
admin.site.register(Kardex,KardexAdmin)
admin.site.register(RevisionCalificacion)

