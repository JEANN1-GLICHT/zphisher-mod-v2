#!/bin/bash

# ==========================================
# Zphisher Modificado v2.0 - JEANN1-GLICHT
# Optimizado para Guatemala & Termux
# ==========================================

# Colores para que se vea pro
G='\033[0;32m'
B='\033[0;34m'
R='\033[0;31m'
NC='\033[0m' # Sin color

clear
echo -e "${B}=========================================="
echo -e "${G}    INSTALADOR DE ZPHISHER MOD V2.0"
echo -e "${G}          BY JEANN1-GLICHT"
echo -e "${B}==========================================${NC}"

# 1. Instalando dependencias
echo -e "\n${B}[+]${NC} Instalando dependencias necesarias..."
pkg update && pkg upgrade -y
pkg install wget php curl unzip git -y

# 2. Limpieza de versiones antiguas
echo -e "${B}[+]${NC} Limpiando instalaciones previas..."
rm -rf ~/zphisher
rm -f zpart_* zphisher_mod.zip

# 3. Descarga de las 4 partes (bypass 25MB)
echo -e "${B}[+]${NC} Descargando componentes desde GitHub (64MB)..."
URL_BASE="https://raw.githubusercontent.com/JEANN1-GLICHT/zphisher-mod-v2/main"

wget -q --show-progress "$URL_BASE/zpart_aa"
wget -q --show-progress "$URL_BASE/zpart_ab"
wget -q --show-progress "$URL_BASE/zpart_ac"
wget -q --show-progress "$URL_BASE/zpart_ad"

# 4. Reconstrucción del archivo
echo -e "\n${B}[+]${NC} Reconstruyendo el paquete modificado..."
cat zpart_* > zphisher_mod.zip
rm zpart_*

# 5. Descompresión y configuración
echo -e "${B}[+]${NC} Descomprimiendo archivos..."
unzip -q zphisher_mod.zip
rm zphisher_mod.zip
chmod +x zphisher/zphisher.sh

# 6. Crear el acceso directo (El truco pro)
echo -e "${B}[+]${NC} Creando acceso directo en el sistema..."
echo "cd ~/zphisher && ./zphisher.sh" > $PREFIX/bin/zphisher
chmod +x $PREFIX/bin/zphisher

clear
echo -e "${G}=========================================="
echo -e "    INSTALACIÓN COMPLETADA CON ÉXITO"
echo -e "==========================================${NC}"
echo -e "Ahora puedes iniciar la herramienta desde"
echo -e "cualquier parte simplemente escribiendo:"
echo -e "\n${B}zphisher${NC}\n"

