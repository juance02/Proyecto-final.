from django.contrib import admin

from categorias.models import Categoria

class categoriaadmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('nombre',)}
    list_display = ('nombre', 'slug')

# Register your models here.

admin.site.register(Categoria, categoriaadmin)


