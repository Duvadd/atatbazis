-- 2.
select nev 
from szineszek
where nemzetiseg != "amerikai"
order by nev asc;

-- 3.
select cim, megjelenes_eve, mufaj, rendezo
from filmek
where mufaj = "vigjatek"
order by megjelenes_eve asc;
-- 4.
select cim, megjelenes_eve, mufaj, jegy_ar
from filmek
where jegy_ar >= 2500 and megjelenes_eve >= 2019
order by jegy_ar desc, megjelenes_eve desc
limit 5;
-- 5.
select  mufaj, count(*) as filmek_szama
from filmek
group by mufaj
order by filmek_szama desc;
-- 6.
SELECT
    sz.nev AS szinesz_nev,
    sz.nemzetiseg AS allampolgarsag,
    f.cim AS film_cim,
    szp.szerepnev AS szerepnev,
    szp.foszerep AS foszerep
FROM filmek f
INNER JOIN szerepek szp
    ON f.id = szp.filmid
INNER JOIN szineszek sz
    ON szp.szineszid = sz.id
WHERE f.rendezo = 'Christopher Nolan'
ORDER BY f.cim ASC, szp.foszerep DESC, sz.nev ASC;

-- 7.
SELECT cim, megjelenes_eve, mufaj, rendezo
FROM filmek
LEFT JOIN szerepek
    ON filmek.id = szerepek.filmid
WHERE szerepek.filmid IS NULL
ORDER BY filmek.megjelenes_eve ASC;

-- 8.
SELECT nev, szuletesi_ev
FROM szineszek
WHERE nemzetiseg = (
    SELECT nemzetiseg
    FROM szineszek
    WHERE nev = "Cillian Murphy"
)
AND nev != "Cillian Murphy";

-- 9.
SELECT cim, rendezo
FROM filmek
WHERE rendezo LIKE '%Villeneuve%';

-- 10.
delete from szerepek
where foszerep = 0

-- 11.
SELECT
    szineszek.nev,
    szineszek.nemzetiseg,
    COUNT(DISTINCT szerepek.filmid) AS filmek_szama
FROM szineszek
INNER JOIN szerepek
    ON szineszek.id = szerepek.szineszid
GROUP BY szineszek.id, szineszek.nev, szineszek.nemzetiseg
HAVING COUNT(DISTINCT szerepek.filmid) > 1
ORDER BY filmek_szama DESC;

