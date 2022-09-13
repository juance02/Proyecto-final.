from django.db import models
from cuentas.models import *
from productos.models import *

# Create your models here.
class Pago (models.Model):
    user = models.ForeignKey(Cuentas, on_delete=models.CASCADE)
    pagos_id = models.CharField(max_length=100)
    payment_method = models.CharField(max_length=100)
    monto_id = models.CharField(max_length=100)
    status = models.CharField(max_length=100)
    fecha_creacion = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.pagos_id

class Orden(models.Model):
    ESTADO = (
        ('Nuevo', 'Nuevo'),
        ('Aceptado', 'Aceptado'),
        ('Completado', 'Completado'),
        ('Cancelado', 'Cancelado'),
    )


    user = models.ForeignKey(Cuentas,on_delete=models.SET_NULL, null=True)
    pagos = models.ForeignKey(Pago,on_delete=models.SET_NULL, blank=True, null=True)
    orden_numero = models.CharField(max_length=20)
    nombres = models.CharField(max_length=50 )
    apellidos = models.CharField(max_length=50 )
    numero_telefono = models.CharField(max_length=50 )
    email = models.CharField(max_length=50)
    direccion_linea_1 = models.CharField(max_length=100)
    direccion_linea_2 = models.CharField(max_length=100)
    ciudad = models.CharField(max_length=100)
    departamento = models.CharField(max_length=100)
    orden_descripcion = models.CharField(max_length=100, blank=True)
    orden_total = models.FloatField()
    inpuesto = models.FloatField()
    estado = models.CharField(max_length=50, choices=ESTADO, default='Nuevo' )
    ip = models.CharField(blank=True, max_length=20)
    confirmacion_orden = models.BooleanField(default=False)
    orden_creacion = models.DateTimeField(auto_now_add=True)
    orden_actualizada = models.DateTimeField(auto_now_add=True)
    orden_actualizada = models.DateTimeField(auto_now=True)


    def full_nombre(self):
        return f'{self.nombres} {self.apellidos}'

    def full_direccion(self):
        return f'{self.direccion_linea_1} {self.direccion_linea_2} '

    def __str__(self):
        return self.nombres


class OrdenProducto(models.Model):
    orden = models.ForeignKey(Orden, on_delete=models.CASCADE)
    pagos = models.ForeignKey(Pago, on_delete=models.CASCADE)
    user = models.ForeignKey(Cuentas, on_delete=models.CASCADE)
    productos = models.ForeignKey(Producto, on_delete=models.CASCADE)
    kardex = models.ManyToManyField(Kardex, blank=True)
    cantidad =models.IntegerField()
    precio = models.FloatField()
    ordenado=models.BooleanField(default=False)
    fecha_creacion=models.DateTimeField(auto_now_add=True)
    fecha_actualizado=models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.nombres

