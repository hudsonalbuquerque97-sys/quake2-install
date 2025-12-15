#!/bin/bash

# Simple Yamagi Quake 2 Installer
# For Linux Mint 22.1+ and Ubuntu-based distributions
# Instalador Simples do Yamagi Quake 2
# Para Linux Mint 22.1+ e distribuições baseadas em Ubuntu

set -e

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Detect language
if [[ "$LANG" == pt_BR* ]] || [[ "$LANG" == pt_PT* ]]; then
    LANGUAGE="pt"
else
    LANGUAGE="en"
fi

# Check if running as root
if [ "$EUID" -eq 0 ]; then
    if [ "$LANGUAGE" = "pt" ]; then
        echo -e "${RED}Erro: Não execute este script como root!${NC}"
        echo -e "${YELLOW}Execute como usuário normal.${NC}"
    else
        echo -e "${RED}Error: Do not run this script as root!${NC}"
        echo -e "${YELLOW}Run as normal user.${NC}"
    fi
    exit 1
fi

# Welcome message
if [ "$LANGUAGE" = "pt" ]; then
    echo -e "${GREEN}╔════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║  Instalador Simples - Yamagi Quake 2      ║${NC}"
    echo -e "${GREEN}║  Para Linux Mint 22.1+ / Ubuntu           ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════╝${NC}"
    echo ""
else
    echo -e "${GREEN}╔════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║  Simple Installer - Yamagi Quake 2        ║${NC}"
    echo -e "${GREEN}║  For Linux Mint 22.1+ / Ubuntu            ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════╝${NC}"
    echo ""
fi

# Update package list
if [ "$LANGUAGE" = "pt" ]; then
    echo -e "${BLUE}[1/4] Atualizando lista de pacotes...${NC}"
else
    echo -e "${BLUE}[1/4] Updating package list...${NC}"
fi
sudo apt update

# Install Yamagi Quake 2
if [ "$LANGUAGE" = "pt" ]; then
    echo -e "${BLUE}[2/4] Instalando Yamagi Quake 2...${NC}"
else
    echo -e "${BLUE}[2/4] Installing Yamagi Quake 2...${NC}"
fi
sudo apt install -y yamagi-quake2

# Install libcurl4 (required for the game to run)
if [ "$LANGUAGE" = "pt" ]; then
    echo -e "${BLUE}[3/4] Instalando libcurl4...${NC}"
else
    echo -e "${BLUE}[3/4] Installing libcurl4...${NC}"
fi
sudo apt install -y libcurl4

# Install game-data-packager
if [ "$LANGUAGE" = "pt" ]; then
    echo -e "${BLUE}[4/4] Instalando game-data-packager...${NC}"
else
    echo -e "${BLUE}[4/4] Installing game-data-packager...${NC}"
fi
sudo apt install -y game-data-packager

# Success message
echo ""
if [ "$LANGUAGE" = "pt" ]; then
    echo -e "${GREEN}╔════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║  Instalação concluída com sucesso!        ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${YELLOW}Próximos passos:${NC}"
    echo ""
    echo -e "1. ${BLUE}Obtenha os arquivos .pak do Quake 2${NC}"
    echo -e "   (de uma instalação existente, GOG, Steam, etc.)"
    echo ""
    echo -e "2. ${BLUE}Use o game-data-packager para instalar os dados:${NC}"
    echo -e "   ${GREEN}game-data-packager -i quake2 /caminho/para/arquivos/${NC}"
    echo ""
    echo -e "   Ou se tiver um instalador .exe:"
    echo -e "   ${GREEN}sudo apt install innoextract${NC}"
    echo -e "   ${GREEN}innoextract setup_quake2.exe${NC}"
    echo -e "   ${GREEN}game-data-packager -d ~/ quake2 ./app/${NC}"
    echo -e "   ${GREEN}sudo dpkg -i ~/quake2*.deb${NC}"
    echo ""
    echo -e "3. ${BLUE}Execute o jogo:${NC}"
    echo -e "   ${GREEN}yamagi-quake2${NC}"
    echo ""
else
    echo -e "${GREEN}╔════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║  Installation completed successfully!     ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${YELLOW}Next steps:${NC}"
    echo ""
    echo -e "1. ${BLUE}Get the Quake 2 .pak files${NC}"
    echo -e "   (from existing install, GOG, Steam, etc.)"
    echo ""
    echo -e "2. ${BLUE}Use game-data-packager to install the data:${NC}"
    echo -e "   ${GREEN}game-data-packager -i quake2 /path/to/files/${NC}"
    echo ""
    echo -e "   Or if you have an .exe installer:"
    echo -e "   ${GREEN}sudo apt install innoextract${NC}"
    echo -e "   ${GREEN}innoextract setup_quake2.exe${NC}"
    echo -e "   ${GREEN}game-data-packager -d ~/ quake2 ./app/${NC}"
    echo -e "   ${GREEN}sudo dpkg -i ~/quake2*.deb${NC}"
    echo ""
    echo -e "3. ${BLUE}Run the game:${NC}"
    echo -e "   ${GREEN}yamagi-quake2${NC}"
    echo ""
fi
