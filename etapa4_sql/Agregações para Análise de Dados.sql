-- Contagem de quantos acidentes por UF

select uf, count(*) as total_acidentes
from limpeza_prf lp 
group by lp.uf 
order by total_acidentes desc; -- MG e o estado com maior numero de acidentes, seguido por SC e PR

-- Quantos acidentes ocorreram por municipio?

select municipio, count(*) as total_municipios
from limpeza_prf lp 
group by lp.municipio 
order by total_municipios; -- Acarau, Morros e etc foram os municipios com menos acidentes (2)

-- Quais municipios tiveram mais acidentes?

select municipio, count(*) as maior_municipios
from limpeza_prf lp 
group by lp.municipio 
order by maior_municipios desc 
limit 10; -- Brasilia foi o municipio com maior numero de acidentes, seguido de curitiba

-- Qual classificacao de acidente aparece com mais frequência?

select classificacao_acidente, count(*) as acidente_frequente
from limpeza_prf lp 
group by lp.classificacao_acidente 
order by acidente_frequente desc
limit 1;  -- a classificacao de acidente mais frequente foi "com vitimas feridas", com 94.754 dados

-- Quais tipos de acidente tiveram mais vitimas?

select tipo_acidente, 
sum(mortos + feridos_graves + feridos_leves) as total_vitimas
from limpeza_prf lp 
group by lp.tipo_acidente 
order by total_vitimas desc
limit 5;  -- Queda de ocupante de veiculo foi o tipo de acidente com maior registro de vitimas

-- Existe alguma UF com volume muito diferente das demais?

select uf,
  COUNT(*) AS total_acidentes FROM limpeza_prf
GROUP BY uf
HAVING COUNT(*) > ( --"tem" contagem maior que 2x a media
  SELECT AVG(contagem_uf) -- media de quantos acidentes tem a uf
  FROM ( SELECT COUNT(*) AS contagem_uf FROM limpeza_prf GROUP BY uf) AS subconsulta) * 2
ORDER BY total_acidentes DESC; -- MG, SC e PR tem contagem 2x maior que a media nacional


