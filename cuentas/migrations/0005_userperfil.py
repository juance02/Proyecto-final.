# Generated by Django 4.0.4 on 2022-06-24 19:24

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('cuentas', '0004_rename_numero_telfono_cuentas_numero_telefono'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserPerfil',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('direccion_linea_1', models.CharField(blank=True, max_length=100)),
                ('direccion_linea_2', models.CharField(blank=True, max_length=100)),
                ('image_perfil', models.ImageField(upload_to='userperfil')),
                ('ciudad', models.CharField(blank=True, max_length=20)),
                ('departamento', models.CharField(blank=True, max_length=20)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
