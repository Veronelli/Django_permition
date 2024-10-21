import os, sys
from django.contrib.auth import get_user_model

username = os.getenv('DJANGO_DATABASE_USER', 'django_database_user')
User = get_user_model()

print(username)
print(User.objects.filter(username=username).exists())
if not User.objects.filter(username=username).exists():
    sys.exit(0)
else:
    sys.exit(1)