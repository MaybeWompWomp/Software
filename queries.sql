-- 1. Zjisti všechny klienty, kteří mají potvrzenou rezervaci
SELECT * FROM Rezervace WHERE stav = 'Potvrzeno';

-- 2. Vyhledej zájezdy s cenou vyšší než 15 000 Kč
SELECT * FROM Zajezd WHERE cena > 15000;

-- 3. Zjisti recenze s hodnocením nižším než 4
SELECT * FROM Recenze WHERE hodnoceni < 4;

-- 4. Najdi ubytování s hodnocením vyšším než 4.5
SELECT * FROM Ubytovani WHERE hodnoceni > 4.5;

-- 5. Najdi klienty, jejichž email obsahuje "example.com"
SELECT * FROM Klient WHERE email LIKE '%example.com';

-- 6. Zobraz všechny zájezdy do Itálie
SELECT * FROM Zajezd WHERE destinace = 'Itálie';

-- 7. Zobraz všechny rezervace, kde počet osob je větší než 2
SELECT * FROM Rezervace WHERE pocet_osob > 2;

-- 8. Vyber klienty, kteří mají recenzi s hodnocením 5
SELECT k.jmeno, k.prijmeni FROM Klient k
JOIN Recenze r ON k.id_klienta = r.id_klienta
WHERE r.hodnoceni = 5;

-- 9. Zjisti, kteří průvodci byli na zájezdech do Itálie
SELECT p.jmeno, p.prijmeni FROM Pruvodce p
JOIN PruvodceNaZajezdu pnz ON p.id_pruvodce = pnz.id_pruvodce
JOIN Zajezd z ON pnz.id_zajezdu = z.id_zajezdu
WHERE z.destinace = 'Itálie';

-- 10. Vyhledej klienty, kteří se zúčastnili zájezdu s názvem "Letní Itálie"
SELECT k.jmeno, k.prijmeni FROM Klient k
JOIN Rezervace r ON k.id_klienta = r.id_klienta
JOIN Zajezd z ON r.id_zajezdu = z.id_zajezdu
WHERE z.nazev = 'Letní Itálie';

-- 11. Zobraz ubytování a k němu počet nocí, pomocí LEFT JOIN
SELECT u.nazev, unz.pocet_noci FROM Ubytovani u
LEFT JOIN UbytovaniNaZajezdu unz ON u.id_ubytovani = unz.id_ubytovani;

-- 12. Najdi zájezdy a u nich průvodce pomocí RIGHT JOIN
SELECT z.nazev, p.jmeno, p.prijmeni FROM Zajezd z
RIGHT JOIN PruvodceNaZajezdu pnz ON z.id_zajezdu = pnz.id_zajezdu
JOIN Pruvodce p ON pnz.id_pruvodce = p.id_pruvodce;

-- 13. Zobraz počet recenzí pro každý zájezd
SELECT z.nazev, COUNT(r.id_recenze) AS pocet_recenzi
FROM Zajezd z
JOIN Recenze r ON z.id_zajezdu = r.id_zajezdu
GROUP BY z.id_zajezdu;

-- 14. Zobraz zájezdy, které mají více než 1 recenzi
SELECT z.nazev, COUNT(r.id_recenze) AS pocet_recenzi
FROM Zajezd z
JOIN Recenze r ON z.id_zajezdu = r.id_zajezdu
GROUP BY z.id_zajezdu
HAVING COUNT(r.id_recenze) > 1;

-- 15. Zjisti jména průvodců a jejich roli na zájezdech
SELECT p.jmeno, p.prijmeni, pnz.role FROM Pruvodce p
JOIN PruvodceNaZajezdu pnz ON p.id_pruvodce = pnz.id_pruvodce;
