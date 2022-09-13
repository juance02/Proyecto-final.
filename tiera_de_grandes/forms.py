from django import forms
from tiera_de_grandes.views import *
from tiera_de_grandes.models import *

class formsp (forms.ModelForm):
   class Meta:
      model = formm
      fields = ['nombre', 'telefono', 'correo', 'image']