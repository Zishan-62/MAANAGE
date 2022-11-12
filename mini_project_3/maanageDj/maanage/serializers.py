from rest_framework import serializers

from .models import Employee,Address

class AddressSerializer(serializers.ModelSerializer):
    class Meta:
      model=Address
      fields='__all__'
      
class EmployeeSerializer(serializers.ModelSerializer):
    address=AddressSerializer(read_only=True,many=True)
    class Meta:
        model = Employee
        fields = '__all__'
        
