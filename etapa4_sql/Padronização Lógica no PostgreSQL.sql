-- Padronizar municipio removendo espacos e colocando em maiusculo
select municipio,
upper(trim(municipio)) as municipio_padronizado -- coloca tudo em maiusculo - remove espacos das bordas
from limpeza_prf lp 
limit 20;

-- cria uma classificacao com base no numero de mortos
select mortos,
case
	when mortos > 0 then 'COM OBITO' -- SE isso
	else 'SEM OBITO' -- senao
end as indicador_obito
from limpeza_prf lp 
limit 50;

-- muda a classificacao do km texto para km numerico
select km, 
cast(replace(km, ',', ',') as numeric) as km_numerico --converte um valor de um tipo para outro
from limpeza_prf lp 
limit 20;

--VIEW e uma consulta pre definida que nao possui dados proprios. e so uma representacao

CREATE VIEW limpeza_prf_padronizada AS
SELECT
  *,
  UPPER(TRIM(municipio)) AS municipio_padronizado,
  COALESCE(causa_acidente, 'NÃO INFORMADO') AS causa_padronizada
FROM public.limpeza_prf;

