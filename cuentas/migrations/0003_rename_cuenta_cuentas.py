# Generated by Django 4.0.4 on 2022-06-21 18:28

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('admin', '0003_logentry_add_action_flag_choices'),
        ('cuentas', '0002_rename_cuentas_cuenta'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Cuenta',
            new_name='Cuentas',
        ),
    ]