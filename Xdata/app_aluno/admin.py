from django.contrib import admin
from models import *


class AlunoAdmin(admin.ModelAdmin):
    pass

class Situacao_Aluno_Admin(admin.ModelAdmin):
    pass

class Desempenho_Admin(admin.ModelAdmin):
    pass

admin.site.register(Aluno, AlunoAdmin)
admin.site.register(Situacao_Aluno, Situacao_Aluno_Admin)
admin.site.register(Desempenho, Situacao_Aluno_Admin)
