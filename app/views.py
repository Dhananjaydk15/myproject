
from django.shortcuts import render
from rest_framework.response import Response
# Create your views here.
from rest_framework.views import APIView

class Test(APIView):
    def get(self,request,*args,**kwargs):
        return Response("test classsssssssss")
        




