-- Conta total de registros
SELECT COUNT(*) AS total_registros
FROM limpeza_prf lp ; -- Existem 126.848 registros na base

-- Verifica registros sem municipio
select count(*) as total_sem_municipio
from limpeza_prf lp 
where municipio is null; -- não ha nenhum registro de acidentes sem municipio

-- Verifica menor e maior data da base
select min(data_inversa) as primeira_data,
max(data_inversa) as ultima_data
from public.limpeza_prf lp ; -- mostra a primeira ultima data com acidentes registrados

-- Lista categorias distintas de uma coluna textual
select distinct classificacao_acidente
from limpeza_prf lp 
order by classificacao_acidente ; -- Há 3 valores distintos para a classificacao_acidente

-- Quantos registros estao sem a causa do acidente preenchida
select count(*) as sem_causa
from public.limpeza_prf lp 
where lp.causa_acidente is null -- existe 0 registros onde a causa acidente nao esta preenchida

-- Quantos IDs duplicados existem na base? (inconsistência)
select id, count(*) as quantos_id
from public.limpeza_prf lp 
group by id -- agrupa linhas com o mesmo valor
having count(*) > 1 --"possui" contagem maior que 1
order by quantos_id desc; -- existem varios ID duplicados

-- Peguei um ID de exemplo para ver se ele realmente estava duplicado
select *
from limpeza_prf lp --o ID esta duplicado pois em km, uma linha tem 2 casas decimais e a outra apenas 1
where id = 276294.0; 

select *
from limpeza_prf lp --todos os ID que estão duplicados estão duplicados por um erro de decimal em km
where id = 320822.0; 

-- Verifica menor e maior data da base
select min(data_inversa) as primeira_data,
max(data_inversa) as ultima_data
from limpeza_prf lp 
where UF = 'MG' -- mostra o primeiro e o ulitmo registro de acidente em MG

