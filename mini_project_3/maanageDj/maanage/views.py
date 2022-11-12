from django.shortcuts import render, redirect
from maanage.models import Employee,Address
from .serializers import EmployeeSerializer,AddressSerializer
from rest_framework import generics


# Create your views here.
class EmployeeGetCreate(generics.ListCreateAPIView):
    queryset = Employee.objects.all()
    serializer_class = EmployeeSerializer

class EmployeeUpdateDelete(generics.RetrieveUpdateDestroyAPIView):
    queryset = Employee.objects.all()
    serializer_class = EmployeeSerializer
    
class AddressGetCreate(generics.ListCreateAPIView):
    queryset = Address.objects.all()
    serializer_class = AddressSerializer
    
class AddressUpdateDelete(generics.RetrieveUpdateDestroyAPIView):
    queryset = Address.objects.all()
    serializer_class = AddressSerializer

