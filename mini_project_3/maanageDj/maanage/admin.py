from django.contrib import admin

# Register your models here.
from .models import Employee,Address

admin.site.register(Employee)
admin.site.register(Address)