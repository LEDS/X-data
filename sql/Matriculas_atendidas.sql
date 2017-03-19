create view MATRICULAS_ATENDIDAS
select count(*) as quantidade, core_curso.id as curso_id, core_periodo.id as periodo_id, core_curso.nome, core_periodo.ano, core_periodo.semestre
from core_aluno 
inner join core_situacao_aluno
on core_situacao_aluno.aluno_id=core_aluno.id
inner join core_situacao
on core_situacao_aluno.situacao_id=core_situacao.id
inner join core_periodo
on core_situacao_aluno.periodo_id=core_periodo.id
inner join core_curso
on core_aluno.curso_id=core_curso.id
where core_situacao.nome in ('Matriculado')
group by core_curso.nome, core_periodo.ano, core_periodo.semestre,core_curso.id, core_periodo.id
order by core_periodo.ano, core_periodo.semestre