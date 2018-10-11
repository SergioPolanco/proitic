from __future__ import unicode_literals

from django.db import models
from django.utils.text import slugify

# Create your models here.

class InvestigationLines(models.Model):

    class Meta():
        db_table = "investigationlines"

    titulo = models.CharField(max_length = 255, null = False)
    descripcion = models.TextField(null = False)
    slug = models.CharField(max_length=255, unique=True)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.titulo)
        return super(InvestigationLines, self).save(*args, **kwargs)
