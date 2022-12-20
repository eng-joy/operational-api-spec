from rest_framework import serializers

from api.models import Dinosaur


class DinosaurSerializer(serializers.ModelSerializer):
    class Meta:
        model = Dinosaur
        fields = "__all__"
