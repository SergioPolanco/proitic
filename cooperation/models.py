from __future__ import unicode_literals

from django.db import models
from blog import models as blog

# Create your models here.
class Cooperation(models.Model):
    description = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.description
