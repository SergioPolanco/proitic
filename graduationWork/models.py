from __future__ import unicode_literals

from django.db import models
from investigator import models as investigator_model
from django.utils.text import slugify
# Create your models here.
class Grade(models.Model):
    class Meta():
        db_table = "tesisgrade"

    estudiante = models.CharField(max_length = 100, null = False)
    tutor = models.ForeignKey(investigator_model.Investigator)
    titulo = models.CharField(max_length = 100, null = False)
    fechaDefensa = models.DateField(null = False)
    descripcion = models.TextField(null = False)
    archivo = models.FileField(upload_to='tesisgrade/', blank=True, null=True)
    slug = models.CharField(max_length=100, unique=True)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.titulo)
        return super(Grade, self).save(*args, **kwargs)

class PosGrade(models.Model):
    class Meta():
        db_table = "tesisposgrade"

    estudiante = models.CharField(max_length = 100, null = False)
    tutor = models.ForeignKey(investigator_model.Investigator)
    titulo = models.CharField(max_length = 100, null = False)
    fechaDefensa = models.DateField(null = False)
    descripcion = models.TextField(null = False)
    archivo = models.FileField(upload_to='tesisposgrade/', blank=True, null=True)
    slug = models.CharField(max_length=100, unique=True)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.titulo)
        return super(PosGrade, self).save(*args, **kwargs)
