from pyexpat import model
from django.db import models
from django.utils import timezone
from django.urls import reverse
from categorias.models import Categoria
from cuentas.models import *
from autoslug import AutoSlugField
from django.db.models import Avg

# Create your models here.

class Producto(models.Model):
    user = models.ForeignKey(Cuentas,on_delete=models.CASCADE, related_name='product')
    nombre = models.CharField(max_length=50)
    slug= AutoSlugField(populate_from='nombre')
    precio = models.FloatField()  # Field name made lowercase.
    Informacion_de_produccion = models.CharField(max_length=100)
    image = models.ImageField()  # Field name made lowercase.
    stock = models.IntegerField()
    timestamp = models.DateTimeField(default=timezone.now)
    descripcion = models.TextField()
    categoria = models.ForeignKey(Categoria,on_delete=models.CASCADE, related_name='productoscat')
    destacado=models.BooleanField(default=True)
    activo=models.BooleanField(default=False)
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    modificacion_date = models.DateTimeField(auto_now=True)


    def get_url(self):
        return reverse('detalleproducto', args=[self.categoria.slug, self.slug])

    def  __str__(self):
         return self.nombre

    def revisionPromedio(self):
        comentarios = RevisionCalificacion.objects.filter(producto=self, estado=True).aggregate(revision=Avg('calificacion'))
        avg=0
        if comentarios['revision'] is not None:
            avg = float(comentarios['revision'])
            return avg


    class Meta:
        ordering = ['-timestamp']
        verbose_name = 'Producto'
        verbose_name_plural = 'Productos'
        ordering = ['-id']

class KardexManager(models.Manager):
    def calidades(self):
        return super(KardexManager, self).filter(kardex_categoria='calidad', activo=True)


    def cantidades(self):
        return super(KardexManager, self).filter(kardex_categoria='cantidad', activo=True)



kardex_categoria_choice = (
    
    ('calidad', 'calidad'),
    ('cantidad', 'cantidad'),
)


class Kardex (models.Model):
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    kardex_categoria = models.CharField(max_length=100, choices=kardex_categoria_choice)
    kardex_value = models.CharField(max_length=100)
    activo = models.BooleanField(default=True)
    fecha_creacion = models.DateTimeField(auto_now=True)

    objects = KardexManager()
    
    def __str__(self):
        return self.kardex_categoria + ':' + self.kardex_value


class RevisionCalificacion(models.Model):
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    user = models.ForeignKey(Cuentas, on_delete=models.CASCADE)
    Sujeto = models.CharField(max_length=200, blank=True)
    comentario = models.CharField(max_length=500, blank=True)
    calificacion = models.FloatField()
    ip=models.CharField(max_length=20)
    estado=models.BooleanField(default=True)
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_subido = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.Sujeto


    
    

