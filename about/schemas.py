import base64

from django.core.files.base import ContentFile
from rest_framework import serializers
from about.models import About as AboutModel

class AboutSchema (serializers.Serializer):
    mission = serializers.CharField()
    vission = serializers.CharField()
    history = serializers.CharField()
    email = serializers.EmailField()
    phone = serializers.CharField()
    address = serializers.CharField()
    introductoryText = serializers.CharField()
    introductoryImage = serializers.CharField()

    def validate_phone(self, value):
        if len(value) != 8:
            raise serializers.ValidationError("El numero telefonico debe de tener 8 caracteres")
        return value
    
    def create(self, validated_data):
        return AboutModel(**validated_data)

    def update(self, instance, validated_data):
        instance.mission = validated_data.get('mission', instance.mission)
        instance.vission = validated_data.get('vission', instance.vission)
        instance.address = validated_data.get('address', instance.address)
        instance.email = validated_data.get('email', instance.email)
        instance.phone = validated_data.get('phone', instance.phone)
        instance.introductoryText = validated_data.get('introductoryText', instance.introductoryText)

        imgData = validated_data.get('introductoryImage')
        format, imgstr = imgData.split(';base64,') 
        ext = format.split('/')[-1]

        data = ContentFile(base64.b64decode(imgstr), name='temp.' + ext)
        instance.introductoryImage = data
        instance.save()
        return instance