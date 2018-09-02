from __future__ import unicode_literals

from django.db import models

class Testimony(models.Model):
    class Meta():
        db_table = "testimony"

    name = models.CharField(max_length = 50, null = False)
    profession = models.CharField(max_length = 50, null = False)
    expression = models.CharField(max_length = 50, null = False)
    testimony = models.TextField()
    email = models.EmailField(null = False)
    facebook = models.CharField(max_length = 100, null = True)
    twitter = models.CharField(max_length = 100, null = True)
    googlePlus = models.CharField(max_length = 100, null = True )
    photo = models.FileField(upload_to='testimony/', blank=True, null=True)
    active = models.BooleanField(default = 1)
    privacy = models.BooleanField(default = 1)
    date_joined = models.DateField(auto_now_add=True)
