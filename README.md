# Pálenica Brestov — statický web

Toto je náhrada za pôvodný WordPress web na `www.palenicabrestov.sk`.
Je to čistý HTML/CSS, žiadna databáza, žiadny PHP beh — takže sa dá
hostovať zadarmo a nepotrebuje mesačný poplatok za WordPress hosting.

Obsah (texty) je 1:1 prevzatý z aktuálneho webu. Dizajn je nový.

## Čo je vo vnútri

```
index.html        Domov
sluzby.html        Služby
cennik.html        Cenník
fotogaleria.html   Fotogaléria
kontakt.html       Kontakt
css/style.css      Štýly
assets/img/        Obrázky (zatiaľ PRÁZDNE — pozri nižšie)
download-images.sh Skript na stiahnutie originálnych fotiek
```

```bash
chmod +x download-images.sh
./download-images.sh
```

Skript stiahne 18 galérijných fotiek + 3 obrázky zo Služieb priamo
z aktuálneho webu (tie isté URL, ktoré tam sú teraz) a uloží ich pod
správnymi menami do `assets/img/`.

## Over si to lokálne

Stačí dvojklik na `index.html`, alebo v priečinku spusti:

```bash
python3 -m http.server 8000
```

a otvor `http://localhost:8000`.
