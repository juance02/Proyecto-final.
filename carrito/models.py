from django.db import models
from productos.models import *
from cuentas.models import *

# Create your models here.

class Carrito(models.Model):
    carrito_id = models.CharField(max_length=250, blank=True)
    date_creacion = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.carrito_id

class CarritoItem(models.Model):
    user = models.ForeignKey(Cuentas, on_delete=models.CASCADE, null=True)
    productos = models.ForeignKey(Producto, on_delete=models.CASCADE)
    kardexob = models.ManyToManyField(Kardex, blank=True)
    carrito = models.ForeignKey(Carrito, on_delete=models.CASCADE, null=True)
    cantidad = models.IntegerField()
    activo = models.BooleanField(default=True)

    def sub_total(self):
        return self.productos.precio * self.cantidad

    def __unicode__(self):
        return self.productos
