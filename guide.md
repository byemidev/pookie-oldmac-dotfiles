# Guía de Flujo de Trabajo
## Alacritty + Tmux + Zsh + Neovim
### Para MacBook Pro 2015 (macOS Monterey, Intel i5, 8GB RAM)

---

## Índice

1. [Inicio Rápido](#1-inicio-rápido)
2. [Estructura del Entorno](#2-estructura-del-entorno)
3. [Atajos de Teclado](#3-atajos-de-teclado)
4. [Flujo de Trabajo por Proyecto](#4-flujo-de-trabajo-por-proyecto)
5. [Navegación entre Proyectos](#5-navegación-entre-proyectos)
6. [Git Workflow](#6-git-workflow)
7. [Búsqueda y Navegación](#7-búsqueda-y-navegación)
8. [Personalización](#8-personalización)
9. [Solución de Problemas](#9-solución-de-problemas)

---

## 1. Inicio Rápido

### 1.1 Abrir el Entorno

```bash
# Abrir Alacritty (desde Spotlight o Aplicaciones)
Cmd + Espacio → escribe "Alacritty" → Enter

# O desde terminal
open -a Alacritty
```

### 1.2 Iniciar Tmux

```bash
# Nueva sesión de tmux
tmux

# O con nombre específico
tmux new -s mi-proyecto

# O atachar a sesión existente
tmux attach -t mi-proyecto
```

### 1.3 Ver Sesiones Activas

```bash
tmux ls
```

---

## 2. Estructura del Entorno

```
┌─────────────────────────────────────────┐
│  Alacritty (Terminal Emulator)          │
│  ┌─────────────────────────────────┐    │
│  │  Tmux (Session Manager)         │    │
│  │  ┌─────────┬─────────┐          │    │
│  │  │  Pane 1 │  Pane 2 │          │    │
│  │  │ (nvim)  │ (terminal)│        │    │
│  │  ├─────────┴─────────┤          │    │
│  │  │  Pane 3 (git)      │         │    │
│  │  └────────────────────┘         │    │
│  │  [Window 1] [Window 2] [Window 3]│    │
│  └─────────────────────────────────┘    │
└─────────────────────────────────────────┘
```

### Jerarquía

| Nivel       | Descripción                          | Comando        |
|-------------|--------------------------------------|----------------|
| **Session** | Proyecto completo                    | `tmux new -s proyecto` |
| **Window**  | Pestaña dentro del proyecto          | `Ctrl+Space c` |
| **Pane**    | Panel dividido dentro de una window  | `Ctrl+Space v` |

---

## 3. Atajos de Teclado

### 3.1 Prefix Key (Tmux)

El prefijo de tmux es **Ctrl + Space** (en lugar del default Ctrl+B).

> 💡 **Tip**: Presiona `Ctrl+Space`, suelta, luego la tecla de acción.

### 3.2 Gestión de Sesiones

| Acción                  | Comando        |
|-------------------------|----------------|
| Nueva sesión            | `tmux new -s nombre` |
| Listar sesiones         | `tmux ls`      |
| Atachar sesión          | `tmux attach -t nombre` |
| Matar sesión            | `tmux kill-session -t nombre` |
| Renombrar sesión actual | `Ctrl+Space $` |

### 3.3 Gestión de Windows (Pestañas)

| Acción           | Atajo          |
|------------------|----------------|
| Nueva window     | `Ctrl+Space c` |
| Cerrar window    | `Ctrl+Space x` |
| Renombrar window | `Ctrl+Space ,` |
| Siguiente window | `Ctrl+Space n` |
| Anterior window  | `Ctrl+Space p` |
| Ir a window N    | `Ctrl+Space 1` (o 2, 3, etc.) |
| Última window    | `Ctrl+Space l` |

### 3.4 Gestión de Panes (Splits)

| Acción                   | Atajo                           | 
|--------------------------|---------------------------------|
| Split vertical           | `Ctrl+Space v` o `Alt+Shift+h`  |
| Split horizontal         | `Ctrl+Space s` o `Alt+Shift+j`  |
| Navegar pane (arriba)    | `Ctrl+Space k` o `Alt+k`        |
| Navegar pane (abajo)     | `Ctrl+Space j` o `Alt+j`        |
| Navegar pane (izquierda) | `Ctrl+Space h` o `Alt+h`        |
| Navegar pane (derecha)   | `Ctrl+Space l` o `Alt+l`        |
| Cerrar pane              | `Ctrl+Space x` o escribe `exit` |
| Zoom pane (maximizar)    | `Ctrl+Space z`                  |
| Redimensionar pane       | `Ctrl+Space Ctrl+h/j/k/l`       |

### 3.5 Modo Copy (Copiar y Pegar)

| Acción                | Atajo          |
|-----------------------|----------------|
| Entrar modo copy      | `Ctrl+Space [` |
| Iniciar selección     | `v`            |
| Seleccionar línea     | `V`            |
| Selección rectangular | `Ctrl+v`       |
| Copiar selección      | `y`            |
| Pegar                 | `Ctrl+Space ]` |
| Cancelar              | `q`            |

### 3.6 Neovim (dentro de un pane)

| Acción              | Atajo                |
|---------------------|----------------------|
| Abrir archivo       | `v` o `nvim archivo` |
| Guardar             | `:w`                 |
| Salir               | `:q`                 |
| Guardar y salir     | `:wq` o `ZZ`         |
| Modo normal         | `Esc`                |
| Modo insertar       | `i`                  |
| Buscar archivo      | `<leader>ff` (Space+f+f) |
| Buscar texto        | `<leader>fg` (Space+f+g) |
| Árbol de archivos   | `<leader>e` (Space+e) |

---

## 4. Flujo de Trabajo por Proyecto

### 4.1 Crear un Nuevo Proyecto

```bash
# Paso 1: Crear directorio del proyecto
mkdir ~/proyectos/mi-nuevo-proyecto
cd ~/proyectos/mi-nuevo-proyecto

# Paso 2: Inicializar git
git init

# Paso 3: Crear estructura base
mkdir src tests docs

# Paso 4: Abrir tmux con nombre del proyecto
tmux new -s mi-nuevo-proyecto
```

### 4.2 Layout Típico de Desarrollo

Dentro de tmux, crea este layout:

```
┌──────────────────┬──────────────────┐
│                  │                  │
│   Neovim         │   Terminal       │
│   (edición)      │   (comandos)     │
│                  │                  │
├──────────────────┴──────────────────┤
│                                     │
│   Git / Logs                        │
│                                     │
└─────────────────────────────────────┘
```

**Pasos para crearlo:**

```bash
# 1. Dentro de tmux, split vertical
Ctrl+Space v

# 2. En el pane derecho, split horizontal
Alt+j

# 3. En el pane superior izquierdo, abrir neovim
v .

# 4. En el pane superior derecho, terminal para comandos
# (ya es terminal)

# 5. En el pane inferior, git status
# (navega con Alt+j, luego escribe)
git status
```

### 4.3 Guardar y Restaurar Layouts

```bash
# Guardar layout (tmux-resurrect plugin - opcional)
# Por ahora, tmux guarda los layouts automáticamente al detach

# Detach de sesión (conserva todo)
Ctrl+Space d

# Volver más tarde
tmux attach -t mi-nuevo-proyecto
```

---

## 5. Navegación entre Proyectos

### 5.1 Múltiples Sesiones de Tmux

```bash
# Sesión 1: Proyecto A
tmux new -s proyecto-a

# Sesión 2: Proyecto B (en otra terminal)
tmux new -s proyecto-b

# Listar todas
tmux ls
# Output:
# proyecto-a: 3 windows (created Wed Jun 24 14:30:00 2026)
# proyecto-b: 2 windows (created Wed Jun 24 15:00:00 2026)

# Cambiar entre sesiones dentro de tmux
Ctrl+Space s  # muestra lista interactiva
```

### 5.2 Switch Rápido entre Proyectos

```bash
# Atajo personalizado en zsh (ya configurado)
ta           # tmux attach (lista sesiones si hay varias)
tl           # tmux ls

# O usa fzf para seleccionar
Ctrl+Space s
```

### 5.3 Cerrar Proyecto

```bash
# Cerrar sesión completa
tmux kill-session -t proyecto-a

# O desde dentro de tmux
Ctrl+Space :kill-session
```

---

## 6. Git Workflow

### 6.1 Comandos Básicos

```bash
# Ver estado
git status

# Añadir archivos
git add .
git add src/archivo.js

# Commit
git commit -m "feat: nueva funcionalidad"

# Push
git push origin main

# Pull
git pull origin main
```

### 6.2 Aliases Útiles (ya en zshrc)

```bash
# No hay aliases de git por defecto, pero puedes añadir:
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline'
alias gd='git diff'
```

### 6.3 Git dentro de Tmux

Recomendación: usa el **pane inferior** para git:

```
┌──────────────────┬──────────────────┐
│   Neovim         │   Terminal       │
├──────────────────┴──────────────────┤
│   git status / git log --oneline    │
└─────────────────────────────────────┘
```

---

## 7. Búsqueda y Navegación

### 7.1 FZF (Fuzzy Finder)

Ya configurado en zshrc con tema "guts".

| Comando  | Descripción                          |
|----------|--------------------------------------|
| `Ctrl+T` | Buscar archivos en directorio actual |
| `Ctrl+R` | Buscar en historial de comandos      |
| `Alt+C`  | Buscar directorios y cd              |

### 7.2 Neovim Telescope

Dentro de nvim:

| Atajo        | Acción                   |
|--------------|--------------------------|
| `<leader>ff` | Buscar archivos          |
| `<leader>fg` | Buscar texto (live grep) |
| `<leader>fb` | Buscar buffers abiertos  |

> `<leader>` = `Space` (espacio)

### 7.3 NvimTree (Árbol de Archivos)

| Atajo       | Acción                   |
|-------------|--------------------------|
| `<leader>e` | Toggle árbol de archivos |
| `a`         | Crear archivo            |
| `d`         | Eliminar archivo         |
| `r`         | Renombrar                |
| `Enter`     | Abrir archivo            |

---

## 8. Personalización

### 8.1 Cambiar Tema de Colores

Edita `~/.config/alacritty/alacritty.toml`:

```toml
[colors.primary]
background = "#1e1e2e"  # Cambia este color
foreground = "#cdd6f4"  # Y este
```

### 8.2 Cambiar Fuente

```toml
[font]
normal = { family = "JetBrains Mono", style = "Regular" }
size = 13.0
```

### 8.3 Añadir Aliases Personalizados

Edita `~/.zshrc`:

```bash
# Proyectos rápidos
alias p1='cd ~/proyectos/proyecto-a && tmux attach -t proyecto-a'
alias p2='cd ~/proyectos/proyecto-b && tmux attach -t proyecto-b'

# Git mejorado
alias gcm='git commit -m'
alias gco='git checkout'
alias gcb='git checkout -b'

# Utilidades
alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -la'
```

Luego recarga:
```bash
source ~/.zshrc
```

### 8.4 Añadir Plugins a Tmux

Edita `~/.tmux.conf` para añadir plugins como:

```bash
# Plugin manager (tpm)
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-resurrect'    # Guardar/restaurar sesiones
set -g @plugin 'tmux-plugins/tmux-continuum'    # Auto-guardar

# Instalar: Ctrl+Space I (mayúscula)
```

---

## 9. Solución de Problemas

### 9.1 Alacritty no abre

```bash
# Verificar firma
xattr -dr com.apple.quarantine /Applications/Alacritty.app

# O abrir manualmente desde Preferencias del Sistema
# Seguridad y Privacidad → General → "Abrir de todos modos"
```

### 9.2 Fuente no encontrada

```bash
# Ver fuentes disponibles
fc-list : family | grep -i "mono"

# Instalar JetBrains Mono
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono

# Cambiar en config
sed -i '' 's/Fira Code/JetBrains Mono/' ~/.config/alacritty/alacritty.toml
```

### 9.3 Tmux no reconoce colores

```bash
# Verificar terminal
echo $TERM
# Debe decir: tmux-256color

# Si no, recargar config
tmux source-file ~/.tmux.conf
```

### 9.4 Neovim lento en Mac 2015

```bash
# Reducir plugins cargados
# En init.lua, comenta plugins que no uses

# O usa versión ligera de nvim
alias v='nvim --clean'
```

### 9.5 Atajos de Alt no funcionan

```bash
# Verificar que tmux tiene el prefix correcto
tmux show -g prefix
# Debe mostrar: prefix C-Space

# Si no, recargar
tmux source-file ~/.tmux.conf
```

### 9.6 Recuperar sesión después de reinicio

```bash
# Tmux no guarda sesiones por defecto
# Usa tmux-resurrect plugin o:

# Script simple para recrear layout
cd ~/proyectos/mi-proyecto
tmux new-session -d -s mi-proyecto
tmux split-window -h
tmux split-window -v
tmux select-pane -t 0
tmux send-keys 'nvim .' Enter
tmux attach -t mi-proyecto
```

---

## Referencia Rápida (Tarjeta)

```
┌─────────────────────────────────────┐
│  TMUX                               │
│  Prefix: Ctrl+Space                 │
│  ─────────────────────────────────  │
│  c → new window                     │
│  v → split vertical                 │
│  s → split horizontal               │
│  h/j/k/l → navegar panes            │
│  d → detach                         │
│  x → close pane/window              │
│  [ → copy mode                      │
│  z → zoom pane                      │
│  ─────────────────────────────────  │
│  Alt+h/j/k/l → navegar (rápido)     │
│  Alt+Shift+h/j → nuevo split        │
└─────────────────────────────────────┘

┌─────────────────────────────────────┐
│  NEOVIM                             │
│  Leader: Space                      │
│  ─────────────────────────────────  │
│  <leader>ff → find files            │
│  <leader>fg → live grep             │
│  <leader>e  → file tree             │
│  <leader>w  → save                  │
│  :q → quit                          │
└─────────────────────────────────────┘

┌─────────────────────────────────────┐
│  ZSH                                │
│  ─────────────────────────────────  │
│  v → nvim                           │
│  t → tmux                           │
│  ta → tmux attach                   │
│  tl → tmux ls                       │
│  Ctrl+T → fzf files                 │
│  Ctrl+R → fzf history               │
└─────────────────────────────────────┘
```

---

## Créditos

- Configuración original: [pookie-dotfiles](https://github.com/vossenwout/pookie-dotfiles) por vossenwout
- Migración a Alacritty para MacBook Pro 2015
- Tema "guts" adaptaºdo para Alacritty
