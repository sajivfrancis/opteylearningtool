from django.db import models
from datetime import datetime

# Create your models here.
class File(models.Model):
    title = models.CharField(max_length=255, blank=True)
    file = models.FileField(upload_to='')
    text = models.TextField()
    uploaded_at = models.DateTimeField(auto_now_add=True)
