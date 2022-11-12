from django.contrib import admin
from django.urls import path, include
from maanage import views
from rest_framework import routers
from .views import EmployeeGetCreate,EmployeeUpdateDelete,AddressGetCreate,AddressUpdateDelete



urlpatterns = [
path('employee', EmployeeGetCreate.as_view()),
path('employee/<int:pk>',EmployeeUpdateDelete.as_view()),
path('address/<int:pk>',AddressUpdateDelete.as_view()),
path('address',AddressGetCreate.as_view())

]