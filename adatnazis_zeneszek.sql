-- 2.
select * from eloadok
where stilus != 'pop'
order by igazi_nev asc;

-- 3.
select cim, kiadas_eve, kiadonev, ar
from albumok
where kiadas_eve >= 2010 and ar >= 5000
order by kiadas_eve asc, ar desc;

-- 4.
SELECT muvesznev, igazi_nev, szuletesi_ev, stilus
FROM eloadok
WHERE szuletesi_ev < 1980
  AND (stilus = 'rock' OR stilus = 'metal')
ORDER BY szuletesi_ev ASC
LIMIT 5;

-- 5.
SELECT e.muvesznev, COUNT(a.id) AS albumszam
FROM eloadok e
JOIN albumok a ON e.id = a.eloadoid
GROUP BY e.id, e.muvesznev
ORDER BY albumszam DESC
LIMIT 5;

-- 6.
SELECT e.muvesznev, e.stilus, e.szuletesi_ev
FROM eloadok e
LEFT JOIN albumok a ON e.id = a.eloadoid
WHERE a.id IS NULL
ORDER BY e.muvesznev ASC;

-- 7.
SELECT muvesznev, igazi_nev, szuletesi_ev
FROM eloadok
WHERE stilus = (
    SELECT stilus
    FROM eloadok
    WHERE muvesznev = 'Queen'
)
AND muvesznev <> 'Queen'
ORDER BY muvesznev ASC;

-- 8.
UPDATE albumok
SET kiadonev = 'Warner Music Group'
WHERE kiadonev = 'Warner Bros. Records';

-- 9.
DELETE FROM dalok
WHERE hossz_mp < 80;

-- 10.
SELECT a.cim AS album_neve,
       a.kiadas_eve,
       d.sorszam,
       d.cim AS dal_neve
FROM eloadok e
JOIN albumok a ON e.id = a.eloadoid
JOIN dalok d ON a.id = d.albumid
WHERE e.muvesznev = 'Daft Punk'
ORDER BY a.kiadas_eve ASC, d.sorszam ASC;

-- 11.
SELECT e.muvesznev AS eloado,
       a.cim AS album,
       a.kiadas_eve,
       COUNT(d.id) AS dalok_szama
FROM albumok a
JOIN eloadok e ON a.eloadoid = e.id
JOIN dalok d ON a.id = d.albumid
GROUP BY a.id, a.cim, e.muvesznev, a.kiadas_eve
HAVING COUNT(d.id) >= 5
ORDER BY dalok_szama DESC;