select
AVG(d.nota), 
MAX(d.nota),
MIN(d.nota),
s.nome as situacao,
di.nome as disciplina,
se.ano,
se.semestre
from core_desempenho d
inner join core_situacao s on s.id = d.situacao_id
inner join core_disciplina di on di.id = d.disciplina_id
inner join core_periodo se on se.id = d.periodo_id
group by s.nome,di.nome, se.ano, se.sem
