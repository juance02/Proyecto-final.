from dataclasses import fields
from unittest.util import _MAX_LENGTH
from django.db import models

# Create your models here.

class formm(models.Model):
   nombre = models.CharField(max_length=100, blank=True)
   telefono = models.IntegerField()
   correo = models.CharField(max_length=100)
   image = models.ImageField()

   

