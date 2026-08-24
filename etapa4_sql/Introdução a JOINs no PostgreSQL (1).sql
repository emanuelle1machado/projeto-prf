-- as tabelas relacionadas foram as de limpeza_prf e uma de regioes com apenas duas colunas: uf e regioes
-- a coluna usada como chave foi a UF pois estava presente nas duas tabelas

-- relaciona cada acidente com a uf, municipio e a regiao
select a.uf, a.municipio, r.regiao
from public.limpeza_prf a
left join public.ufs_regioes_two r --todas as linhas a esquerda, se nao houver correspondencia a direita : null
  on a.uf = r.uf
limit 50;

-- descarta acidentes sem acidentes
select a.uf, a.municipio, r.regiao
from public.limpeza_prf a
inner join public.ufs_regioes_two r --so analisa acidentes que sabe qual a regiao que pertencem
  on a.uf = r.uf
limit 50;

-- Total de linhas antes do JOIN
select count(*) as total_antes
from public.limpeza_prf; --126875 antes do join

-- Total de linhas depois do LEFT JOIN
select count(*) as total_depois_left
from public.limpeza_prf a
left join public.ufs_regioes_two r
  on a.uf = r.uf; --126875 depois do left join
  
-- Total de linhas depois do INNER JOIN
select count(*) as total_depois_inner
from public.limpeza_prf a
inner join public.ufs_regioes_two r
  on a.uf = r.uf;  -- 126875 depois do inner join
  
 -- Como não ha acidentes sem regiões, o total de linhas e igual em todas.
  
 -- Se houvesse um erro de digitacao nas regioes, ao usar o join, a contagem de acidentes seria errada 
  -- mesmo nao havendo erro na tabela com os dados de acidente