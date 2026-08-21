#!/usr/bin/env bash
# ============================================================
# Stiahne originálne obrázky zo živého WordPress webu
# (www.palenicabrestov.sk) do priečinka assets/img tohto
# statického webu.
#
# DÔLEŽITÉ: spusti tento skript na SVOJOM počítači, z priečinka
# palenica-brestov/ (tam, kde je aj index.html). Toto NEBEŽÍ
# samo od seba — ja (Claude) som ho k tvojmu webu nemohol
# spustiť, lebo moje sandboxované prostredie nemá prístup na
# tvoju doménu.
#
# Použitie:
#   chmod +x download-images.sh
#   ./download-images.sh
# ============================================================
set -e

BASE="https://www.palenicabrestov.sk/wp-content/uploads"
mkdir -p assets/img/gallery

fetch() {
  local url="$1" out="$2"
  echo "→ $out"
  curl -fsSL "$url" -o "$out" || echo "  ⚠️  Nepodarilo sa stiahnuť $url"
}

# --- Hero / služby ---
fetch "$BASE/2025/08/1000006849-scaled.jpg"                 "assets/img/hero-priprava.jpg"
fetch "$BASE/2020/10/plum-box-fruit-1898196-782x1024.jpg"    "assets/img/sluzby-ovocie.jpg"
fetch "$BASE/2020/10/20160907_105555-577x1024.jpg"           "assets/img/destilacia-zariadenie.jpg"

# --- Fotogaléria: náhľad (menší) + plná verzia ---
fetch "$BASE/2023/03/IMG_20220528_142249-150x150.jpg"        "assets/img/gallery/g01-142249.jpg"
fetch "$BASE/2023/03/IMG_20220528_142249-scaled.jpg"         "assets/img/gallery/g01-142249-full.jpg"

fetch "$BASE/2023/03/IMG_20220603_174742-150x150.jpg"        "assets/img/gallery/g02-174742.jpg"
fetch "$BASE/2023/03/IMG_20220603_174742-scaled.jpg"         "assets/img/gallery/g02-174742-full.jpg"

fetch "$BASE/2023/03/IMG_20220603_174756-150x150.jpg"        "assets/img/gallery/g03-174756.jpg"
fetch "$BASE/2023/03/IMG_20220603_174756-scaled.jpg"         "assets/img/gallery/g03-174756-full.jpg"

fetch "$BASE/2023/03/IMG_20220603_205236-150x150.jpg"        "assets/img/gallery/g04-205236.jpg"
fetch "$BASE/2023/03/IMG_20220603_205236-scaled.jpg"         "assets/img/gallery/g04-205236-full.jpg"

fetch "$BASE/2023/03/IMG-20220618-WA0003-150x150.jpg"        "assets/img/gallery/g05-wa0003.jpg"
fetch "$BASE/2023/03/IMG-20220618-WA0003.jpg"                "assets/img/gallery/g05-wa0003-full.jpg"

fetch "$BASE/2023/03/IMG-20220622-WA0007-150x150.jpg"        "assets/img/gallery/g06-wa0007.jpg"
fetch "$BASE/2023/03/IMG-20220622-WA0007.jpg"                "assets/img/gallery/g06-wa0007-full.jpg"

fetch "$BASE/2020/10/IMG_6777-150x150.jpg"                   "assets/img/gallery/g07-6777.jpg"
fetch "$BASE/2020/10/IMG_6777-scaled.jpg"                    "assets/img/gallery/g07-6777-full.jpg"

fetch "$BASE/2020/10/IMG_6776-150x150.jpg"                   "assets/img/gallery/g08-6776.jpg"
fetch "$BASE/2020/10/IMG_6776-scaled.jpg"                    "assets/img/gallery/g08-6776-full.jpg"

fetch "$BASE/2020/10/IMG_6203-1-150x150.jpg"                 "assets/img/gallery/g09-6203.jpg"
fetch "$BASE/2020/10/IMG_6203-1.jpg"                         "assets/img/gallery/g09-6203-full.jpg"

fetch "$BASE/2020/10/IMG_6204-2-150x150.jpg"                 "assets/img/gallery/g10-6204.jpg"
fetch "$BASE/2020/10/IMG_6204-2.jpg"                         "assets/img/gallery/g10-6204-full.jpg"

fetch "$BASE/2020/10/IMG_6193-1-150x150.jpg"                 "assets/img/gallery/g11-6193.jpg"
fetch "$BASE/2020/10/IMG_6193-1.jpg"                         "assets/img/gallery/g11-6193-full.jpg"

fetch "$BASE/2020/10/IMG_20190526_183303_resized_20190526_065743024-150x150.jpg" "assets/img/gallery/g12-183303.jpg"
fetch "$BASE/2020/10/IMG_20190526_183303_resized_20190526_065743024.jpg"         "assets/img/gallery/g12-183303-full.jpg"

fetch "$BASE/2020/10/IMG_20190526_183356_resized_20190526_063515558-150x150.jpg" "assets/img/gallery/g13-183356.jpg"
fetch "$BASE/2020/10/IMG_20190526_183356_resized_20190526_063515558.jpg"         "assets/img/gallery/g13-183356-full.jpg"

fetch "$BASE/2020/10/IMG_20200314_135341-150x150.jpg"        "assets/img/gallery/g14-135341.jpg"
fetch "$BASE/2020/10/IMG_20200314_135341-scaled.jpg"         "assets/img/gallery/g14-135341-full.jpg"

fetch "$BASE/2025/08/1000006849-150x150.jpg"                 "assets/img/gallery/g15-1000006849.jpg"
fetch "$BASE/2025/08/1000006849-scaled.jpg"                  "assets/img/gallery/g15-1000006849-full.jpg"

fetch "$BASE/2025/08/1000006855-150x150.jpg"                 "assets/img/gallery/g16-1000006855.jpg"
fetch "$BASE/2025/08/1000006855-scaled.jpg"                  "assets/img/gallery/g16-1000006855-full.jpg"

fetch "$BASE/2025/08/1000006851-150x150.jpg"                 "assets/img/gallery/g17-1000006851.jpg"
fetch "$BASE/2025/08/1000006851-scaled.jpg"                  "assets/img/gallery/g17-1000006851-full.jpg"

fetch "$BASE/2025/08/1000000212-150x150.jpg"                 "assets/img/gallery/g18-1000000212.jpg"
fetch "$BASE/2025/08/1000000212.jpg"                         "assets/img/gallery/g18-1000000212-full.jpg"

echo ""
echo "Hotovo. Skontroluj assets/img/ — ak niečo chýba (napr. WP medzitým"
echo "prepočítal veľkosti obrázkov), stiahni to ručne cez Media Library"
echo "vo WP administrácii a premenuj podľa rovnakého vzoru."
