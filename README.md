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

## 1. Doplň obrázky

Ja som obrázky z tvojej stránky stiahnuť nemohol — moje sandboxované
prostredie nemá prístup na `palenicabrestov.sk` (len na obmedzený
zoznam technických domén ako npm/pypi/github). HTML aj CSS ale presne
počítajú s tým, kam obrázky patria, takže stačí ich doplniť jedným
z dvoch spôsobov:

**A) Automaticky (odporúčané)** — z priečinka `palenica-brestov/` na
svojom počítači spusti:

```bash
chmod +x download-images.sh
./download-images.sh
```

Skript stiahne 18 galérijných fotiek + 3 obrázky zo Služieb priamo
z aktuálneho webu (tie isté URL, ktoré tam sú teraz) a uloží ich pod
správnymi menami do `assets/img/`.

**B) Ručne** — vo WP administrácii choď do *Médiá → Knižnica médií*,
stiahni originály vo vyššom rozlíšení a premenuj ich podľa vzoru
v `download-images.sh` (napr. `hero-priprava.jpg`, `assets/img/gallery/g01-142249.jpg`...).
Toto je pomalšie, ale dá ti to fotky v plnom rozlíšení namiesto
zmenšenín, ktoré WordPress ukladal pre web.

## 2. Over si to lokálne

Stačí dvojklik na `index.html`, alebo v priečinku spusti:

```bash
python3 -m http.server 8000
```

a otvor `http://localhost:8000`.

## 3. Kam to nahodiť zadarmo

Statický web ako tento vie hostovať zadarmo viacero služieb. V skratke:

| | GitHub Pages | Cloudflare Pages | Netlify |
|---|---|---|---|
| Cena | zadarmo | zadarmo | zadarmo (do určitého limitu) |
| Vlastná doména (.sk) | áno, cez CNAME súbor + DNS | áno, priamo cez Cloudflare DNS | áno, cez DNS |
| CDN v EU | slušné | veľmi rýchle, silné v EÚ | slušné |
| Nasadenie | `git push` | `git push` alebo drag&drop | `git push` alebo drag&drop |
| Zložitosť pre začiatočníka | najjednoduchšie | o niečo viac krokov (presun DNS) | podobne ako GH Pages |

Pre jednoduchý statický web ako tento by som volil **GitHub Pages** —
najmenej krokov, žiadny presun DNS správcu domény, len pridanie
dvoch-troch DNS záznamov. Cloudflare Pages dáva zmysel, ak by si chcel
neskôr aj rýchlejšiu CDN sieť alebo formuláre, čo tu zatiaľ netreba.

### Nasadenie na GitHub Pages — presne pre Websupport

Doména aj hosting sú u teba oba vo Websupporte, čo je dobrá správa:
DNS aj zrušenie hostingu riešiš na jednom mieste, a nie je to prepojené —
sú to dve oddelené položky v **Služby**, takže zrušenie hostingu doménu
neovplyvní.

1. Vytvor nový repozitár na GitHube (napr. `palenica-brestov`) a nahraj doň
   obsah tohto priečinka (aj s doplnenými obrázkami).
2. V repozitári choď do **Settings → Pages**, ako zdroj vyber vetvu
   `main` a priečinok `/ (root)`, a do poľa **Custom domain** vlož
   `www.palenicabrestov.sk` (GitHub ti sám vytvorí súbor `CNAME`).
3. Prihlás sa do **admin.websupport.sk (Webadmin)** → **Služby** →
   **Administrácia** pri `palenicabrestov.sk` → **DNS**:
   - záložka **CNAME** → nový záznam: pre adresu `www`, cieľ
     `<tvoj-github-username>.github.io`
   - záložka **ANAME** → nový záznam pre hlavnú (holú) doménu, cieľ
     `<tvoj-github-username>.github.io`. Websupport podporuje ANAME
     práve pre tento prípad — je to lepšie než ručne zadávať GitHubove
     IP adresy do A záznamov, lebo ANAME sa samo prepočítava, ak sa tie
     IP niekedy zmenia.
   - záložku **Nameserver** nechaj tak, ako je (predvolené Websupport
     NS) — DNS správu meníš len na úrovni jednotlivých záznamov, nie
     migráciou celej domény inam.
4. Počkaj na prejavenie zmien (bežne do pár hodín) a v GitHub Pages
   nastaveniach zapni **Enforce HTTPS**.
5. Až keď web beží na `www.palenicabrestov.sk` cez GitHub, zruš vo
   Websupporte **len webhostingovú službu** — doména ostáva
   registrovaná a spravovaná tam ďalej, plus platíš už len za ňu
   (rádovo jednotky eur ročne za `.sk`), nie za hosting.

### Nasadenie na Cloudflare Pages (alternatíva)

1. Repozitár pripoj v Cloudflare Pages (alebo nahraj priečinok priamo).
   Build command nechaj prázdny, output priečinok `/`.
2. V Cloudflare pridaj doménu `palenicabrestov.sk`, prepni nameservery
   na Cloudflare u registrátora domény, priraď doménu k Pages projektu.

## Dôležité pred zrušením WP hostingu

- Doména a hosting môžu, ale nemusia byť u toho istého poskytovateľa.
  Skontroluj to skôr, než čokoľvek zrušíš — ak zrušíš hosting a doména
  je naviazaná naň, môžeš prísť aj o doménu.
- E‑mail `palenicabrestov@gmail.com` beží na Gmaili, nie na WP hostingu
  — zrušenie hostingu naň nemá vplyv.
- Mapa a telefón/e‑mail odkazy na stránke Kontakt fungujú staticky bez
  akéhokoľvek backendu, takže tu nie je čo migrovať.
- Web nemá žiadny kontaktný formulár, takže nie je potrebné riešiť
  náhradu (napr. Formspree) — bežný problém pri prevode WP → statický web,
  ktorý sa tu odpadá.
