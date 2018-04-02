from django.contrib import admin
from models import *


class CorAdmin(admin.ModelAdmin):
    pass

admin.site.register(Cor, CorAdmin)
