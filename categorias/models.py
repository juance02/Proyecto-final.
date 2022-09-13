from django.db import models
from django.urls import reverse

# Create your models here.

class Categoria(models.Model):
    nombre = models.CharField(max_length=45)
    slug = models.CharField(max_length=100, unique=True)
    descripcion = models.TextField()
    image = models.ImageField(blank=True, null=True)
    activo=models.BooleanField(default=True)

    def get_url(self):
        return reverse('productos_categoria', args=[self.slug])

    def __str__(self):
        return self.nombre

    class Meta:
        verbose_name_plural='Categoria'