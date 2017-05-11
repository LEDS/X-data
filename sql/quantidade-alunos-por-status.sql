SELECT desc_sit_matricula, COUNT(desc_sit_matricula) AS qtd FROM (SELECT DISTINCT historico.hash_cod_matricula, matriculas.desc_sit_matricula
FROM historico_escolar_notas_impessoalizado AS historico
INNER JOIN matriculas_impessoalizadas AS matriculas 
ON (historico.hash_cod_matricula = matriculas.hash_cod_matricula)
WHERE  historico.cod_curso=1200
GROUP BY matriculas.desc_sit_matricula, historico.hash_cod_matricula) AS mat
GROUP BY desc_sit_matricula;






