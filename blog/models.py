from __future__ import unicode_literals

from django.db import models
from investigator import models as investigator
from django.utils.text import slugify
# Create your models here.

class Tag(models.Model):
    name = models.CharField(max_length=100, unique=True)
    slug = models.CharField(max_length=100, unique=True)

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        return super(Tag, self).save(*args, **kwargs)

class Article(models.Model):
    title = models.CharField(max_length=400)
    city = models.CharField(max_length=400)
    year = models.IntegerField(default=2016)
    slug = models.CharField(max_length=255, unique=True)
    active = models.BooleanField(default = 1)
    body = models.TextField()
    authors = models.TextField(default='', null=True)
    owner = models.ForeignKey(investigator.Investigator, related_name="article_owner", on_delete=models.CASCADE)
    categorys = models.ForeignKey('Subcategory', on_delete=models.CASCADE)
    tags = models.ManyToManyField(Tag, related_name="article_tags")
    created_at = models.DateTimeField(auto_now_add=True)
    update_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        return super(Article, self).save(*args, **kwargs)

    def get_string_tags(self):
        return ', '.join([tag.name for tag in self.tags.all()])

class Media(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    photo = models.FileField(upload_to='blog/', blank=True, null=True)

class Category(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    slug = models.CharField(max_length=255, unique=True, null=True)
    active = models.BooleanField(default = 1)
    name = models.CharField(max_length=200, unique=True)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        return super(Category, self).save(*args, **kwargs)

class Subcategory(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    slug = models.CharField(max_length=255, unique=True, null=True)
    active = models.BooleanField(default = 1)
    category = models.ForeignKey(Category, related_name="category_relation", on_delete=models.CASCADE)
    name = models.CharField(max_length=200, unique=True)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        return super(Subcategory, self).save(*args, **kwargs)

class BlogArticle(models.Model):
    body = models.TextField()
    article = models.ForeignKey("Article", on_delete=models.CASCADE)
