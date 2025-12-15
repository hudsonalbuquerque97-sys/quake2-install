# Yamagi Quake 2 - Instalador Simples

Um script automatizado para instalar o Yamagi Quake 2 no Linux Mint 22.1+ e Ubuntu.

---

## 📦 O que este script faz?

O script instala três componentes essenciais:

1. **Yamagi Quake 2** - O motor do jogo
2. **game-data-packager** - Ferramenta para processar os arquivos do jogo
3. **libcurl4** - Biblioteca necessária para o jogo funcionar

---

## 🎮 O que é Yamagi Quake 2?

Yamagi Quake 2 é um **port moderno e open-source** do Quake 2 original. Ele mantém a jogabilidade clássica, mas com melhorias para sistemas modernos:

- ✅ Funciona perfeitamente em Linux, Windows e macOS
- ✅ Suporte a resoluções widescreen e 4K
- ✅ Compatível com hardware moderno
- ✅ Bugs corrigidos do jogo original
- ✅ Melhor desempenho
- ✅ Suporte a todas as expansões oficiais

**Em resumo:** É a melhor forma de jogar Quake 2 hoje em dia!

---

## 📦 O que é game-data-packager?

O **game-data-packager** é uma ferramenta do Debian/Ubuntu que:

- Pega os arquivos originais do jogo (que você já possui)
- Cria pacotes `.deb` a partir desses arquivos
- Instala os dados do jogo no lugar correto do sistema

**Por que usar?** Ele organiza tudo automaticamente e permite que o sistema gerencie os arquivos do jogo como qualquer outro pacote instalado.

---

## 🔧 Por que instalar libcurl4?

A **libcurl4** é uma biblioteca que o Yamagi Quake 2 precisa para:

- Baixar atualizações
- Conectar a servidores multiplayer
- Acessar recursos online

**Sem ela**, o jogo trava na tela de loading com erro: `libcurl.so.4: cannot open shared object file`

---

## 🚀 Como usar o script

### 1. Baixe e prepare o script

```bash
# Dê permissão de execução
chmod +x install_yamagi_simple.sh

# Execute o script
./install_yamagi_simple.sh
```

### 2. O que o script faz automaticamente

- Atualiza a lista de pacotes
- Instala Yamagi Quake 2
- Instala libcurl4
- Instala game-data-packager

**Pronto!** Agora você tem tudo instalado, mas ainda precisa dos arquivos do jogo.

---

## 📁 Como usar o game-data-packager

Você precisa dos arquivos originais do Quake 2. Eles podem vir de:

- 🎮 **Steam** - Se você comprou o jogo
- 🛒 **GOG.com** - Versão DRM-free
- 💿 **CD original** - Se ainda tiver
- 📦 **Instalação existente** - De outro computador

### ⚠️ IMPORTANTE: Problema conhecido

O **game-data-packager** frequentemente apresenta erro ao tentar instalar os pacotes automaticamente (erro com `pkexec`/`polkit`). 

**Solução:** Use a flag `-d` para gerar os pacotes sem tentar instalá-los, e depois instale manualmente com `sudo dpkg -i`.

### Opção 1: Se você tem um instalador .exe (GOG)

```bash
# 1. Instale o innoextract
sudo apt install innoextract

# 2. Extraia o instalador
innoextract setup_quake2_*.exe

# 3. Gere os pacotes .deb (SEM instalar automaticamente - use -d)
game-data-packager -d ~/ quake2 ./app/

# 4. Instale os pacotes gerados MANUALMENTE
sudo dpkg -i ~/quake2*.deb
```

### Opção 2: Se você tem os arquivos .pak diretos

```bash
# Se os arquivos estão em uma pasta específica
# SEMPRE use -d para gerar sem instalar automaticamente
game-data-packager -d ~/ quake2 /caminho/para/pasta/com/baseq2/

# Depois instale os pacotes MANUALMENTE
sudo dpkg -i ~/quake2*.deb
```

### Opção 3: Se você tem o jogo no Steam

```bash
# Os arquivos geralmente estão aqui:
# Use -d para evitar erro de instalação automática
game-data-packager -d ~/ quake2 ~/.steam/steam/steamapps/common/Quake\ 2/

# Depois instale MANUALMENTE
sudo dpkg -i ~/quake2*.deb
```

### 💡 Por que sempre usar -d e instalar manualmente?

O `game-data-packager` tenta instalar automaticamente usando `pkexec`, mas isso geralmente falha com o erro:

```
polkit-agent-helper-1: error response to PolicyKit daemon: 
GDBus.Error:org.freedesktop.PolicyKit1.Error.Failed: No session for cookie
==== AUTHENTICATION FAILED ====
```

**Solução definitiva:** 
1. Use sempre a flag `-d ~/` para gerar os pacotes na sua pasta home
2. Instale manualmente com `sudo dpkg -i ~/quake2*.deb`
3. Pronto! Funciona perfeitamente.

---

## 🎯 Executando o jogo

Depois de instalar os dados, é só rodar:

```bash
yamagi-quake2
```

### Jogar as expansões e mods

Se você instalou as expansões, pode jogá-las assim:

```bash
yamagi-quake2                      # Jogo base
yamagi-quake2 +set game xatrix     # Mission Pack 1: The Reckoning
yamagi-quake2 +set game rogue      # Mission Pack 2: Ground Zero
yamagi-quake2 +set game zaero      # Zaero
yamagi-quake2 +set game jugger     # Juggernaut
yamagi-quake2 +set game smd        # Slight Mechanical Destruction
yamagi-quake2 +set game ctf        # Capture The Flag
```

---

## ❓ Solução de problemas

### Jogo trava na tela de loading

```bash
# Instale a libcurl4 (o script já faz isso)
sudo apt install libcurl4
```

### game-data-packager falha ao instalar automaticamente (ERRO COMUM!)

**Sintoma:** Erro com `pkexec`, `polkit`, ou "No session for cookie"

**Solução:**
```bash
# SEMPRE use -d para gerar os pacotes sem tentar instalar
game-data-packager -d ~/ quake2 /caminho/dos/arquivos/

# Depois instale MANUALMENTE
sudo dpkg -i ~/quake2*.deb

# Se der erro de dependências:
sudo apt-get install -f
```

**Este é um problema conhecido do game-data-packager no Ubuntu/Mint!**

### Não consigo encontrar meus arquivos do jogo

```bash
# Procure por pak0.pak no seu sistema
find ~ -name "pak0.pak" 2>/dev/null
```

---

## 📋 Requisitos do Sistema

- **SO:** Linux Mint 22.1+ ou Ubuntu 22.04+
- **Espaço:** ~500 MB para o jogo completo
- **Arquivos originais:** Você precisa ter o Quake 2 original (GOG, Steam ou CD)

---

## 📝 Arquivos gerados pelo game-data-packager

Quando você roda o game-data-packager, ele cria vários pacotes `.deb`:

- `quake2-full-data` - Dados completos do jogo base
- `quake2-music` - Trilha sonora do jogo base
- `quake2-reckoning-data` - Mission Pack 1: The Reckoning
- `quake2-reckoning-music` - Música do Mission Pack 1
- `quake2-groundzero-data` - Mission Pack 2: Ground Zero
- `quake2-groundzero-music` - Música do Mission Pack 2
- `quake2-zaero-data` - Mod Zaero (se disponível)

**Todos são instalados automaticamente ou podem ser instalados com `sudo dpkg -i`**

---

## 🎮 Divirta-se!

Agora você tem tudo pronto para jogar Quake 2 no Linux como deveria ser jogado - nativo e sem emulação!

**Dica:** Use `yamagi-quake2 +set vid_fullscreen 0` para jogar em modo janela.

---

## 📚 Links úteis

- [Yamagi Quake 2 Site Oficial](https://www.yamagi.org/quake2/)
- [Yamagi GitHub](https://github.com/yquake2/yquake2)
- [Comprar Quake 2 no GOG](https://www.gog.com/game/quake_ii_quad_damage)
- [Quake 2 no Steam](https://store.steampowered.com/app/2320/Quake_II/)

---

**Autor:** Script criado para facilitar a instalação do Yamagi Quake 2  
**Licença:** Livre para uso e modificação  
**Compatibilidade:** Linux Mint 22.1+, Ubuntu 22.04+
