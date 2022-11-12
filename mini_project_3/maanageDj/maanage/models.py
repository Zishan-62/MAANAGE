from django.db import models

# Create your models here.
class Employee(models.Model):
    gender_choices=(('M','Male'),('F','Female'),('O','Others'))
    empid=models.BigAutoField(primary_key=True)
    ename = models.CharField(max_length=100)
    eemail = models.EmailField()
    econtact = models.BigIntegerField(blank=True)
    dob=models.DateField( auto_now=False, auto_now_add=False,default='')
    gender = models.CharField(max_length=1, choices=gender_choices,default='')
    date_joined=models.DateTimeField(  auto_now_add=True,blank=True)
    
    def __str__(self):
        return self.ename
    
    
class Address(models.Model):
    addr=models.CharField( max_length=55,blank=True)
    empid=models.ForeignKey("Employee", on_delete=models.CASCADE,related_name='address')
    state = models.CharField(max_length=30)
    city = models.CharField(max_length=30)
    pincode = models.CharField(max_length=10)
    country = models.CharField(max_length=30)
    
    def __str__(self):
        return str(self.empid)
    
    
    
    
