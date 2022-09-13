from dataclasses import fields
from pyexpat import model
from django import forms
from cuentas.models import Cuentas, UserPerfil

class registrarseForm(forms.ModelForm):

    password = forms.CharField(widget=forms.PasswordInput(attrs={
        'placeholder': 'Ingrese password'
    }))

    confirmar_password = forms.CharField(widget=forms.PasswordInput(attrs={
        'placeholder': 'Confirmar password'
    }))
    class Meta:
        model = Cuentas
        fields = ['nombres', 'apellidos', 'numero_telefono', 'email','password']

    def clean(self):
        cleaned_data = super(registrarseForm, self).clean()
        password = cleaned_data.get('password')
        confirmar_password = cleaned_data.get('confirmar_password')

        if password != confirmar_password:
            raise forms.ValidationError(
                "La contraseña no coiciden"
            )


        
class UsuarioPerfilForm (forms.ModelForm):
    image_perfil = forms.ImageField(required=False, error_messages= {'invalid': ('solo archivos de imagen')}, widget=forms.FileInput)
    class Meta:
        model = UserPerfil
        fields = ('direccion_linea_1', 'direccion_linea_2', 'ciudad', 'departamento', 'image_perfil', 'descripcion')

    def __init__(self, *args, **kwargs):
        super(UsuarioPerfilForm, self).__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'
    


class UserForm (forms.ModelForm):
    class Meta:
        model = Cuentas
        fields = ('nombres', 'apellidos', 'numero_telefono',  )

    def __init__(self, *args, **kwargs):
        super(UserForm, self).__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs['class']= 'form-control'




