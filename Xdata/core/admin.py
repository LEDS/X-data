from django.contrib import admin

# Register your models here.
from .models import Cor, Sexo

class CorAdmin(admin.ModelAdmin):
    list_display = ('nome','sigla')
    list_filter = ['nome','sigla']
    search_fields = ['nome']


class SexoAdmin(admin.ModelAdmin):
    list_display = ('nome','sigla')
    list_filter = ['nome','sigla']
    search_fields = ['nome']

admin.site.register(Sexo,SexoAdmin)

admin.site.register(Cor,CorAdmin)

