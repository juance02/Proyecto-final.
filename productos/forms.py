from struct import calcsize
from productos.models import Producto
from django import forms
from django import forms
from ordenes_de_compra.models import *

class ProductoForm(forms.ModelForm):

    class  Meta:
        model = Producto
        fields = ['nombre', 'precio','stock', 'Informacion_de_produccion', 'descripcion','image','categoria']

class OrdenForm(forms.ModelForm):
    class Meta:
        model = Orden
        fields = ['nombres','apellidos', 'numero_telefono','email', 'direccion_linea_1', 'direccion_linea_2', 'ciudad', 'departamento', 'orden_descripcion']

class comentarioform(forms.ModelForm):
    class Meta:
        model = RevisionCalificacion
        fields = ['Sujeto','comentario','calificacion']