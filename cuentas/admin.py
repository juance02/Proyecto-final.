from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import Cuentas, UserPerfil
from django.utils.html import format_html


class cuentaadmin(UserAdmin):
    list_display = ('email','nombres', 'apellidos', 'nombreusuario', 'last_login', 'date_joined', 'is_active')
    list_display_link = ('email', 'nombres', 'apellidos')
    readonly_fields = ('last_login', 'date_joined')
    ordering = ('-date_joined',)

    filter_horizontal = ()
    list_filter = ()
    fieldsets = ()

class UserPerfiladmin(admin.ModelAdmin):

    def thumbnail(self, object):
        return format_html('<img src="{}" width="30" style="border-radius:50%;">'.format(object.image_perfil.url))

    thumbnail.short_description = 'imagen de perfil'
    list_display = ('thumbnail', 'user', 'ciudad', 'departamento')

# Register your models here.

admin.site.register(Cuentas, cuentaadmin)
admin.site.register(UserPerfil, UserPerfiladmin)


