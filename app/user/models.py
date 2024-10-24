from django.contrib.auth.models import AbstractUser
from django.db import models
from field_history.tracker import FieldHistoryTracker

class CustomUser(AbstractUser):
    bio = models.TextField(blank=True, null=True)
    field_history = FieldHistoryTracker(['username', 'bio', 'is_staff',])

    def __str__(self):
        return self.username
