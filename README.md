# Vim Config
Repositorio con mi configuración para Neovim.

# Guía de instalación
Para instalar esta configuración sólo debemos clonar este repositorio dentro de la carpeta ```.config``` y cambiar el nombre de ese directorio a 'nvim'. Los comandos serían los siguientes:
```
cd ~/.config
git clone git@github.com:nicomr05/vim-config.git
mv vim-config nvim
```

## Nota para distribuciones "antiguas"
Para distribuciones antiguas puede ser que la versión de Neovim no soporte todas las funcionalidades del script principal. Para evitar esto he preparado un script ```init.lua.old```, que funciona al menos con Debian 12 y Ubuntu 24.04.3 (LTS). Únicamente habría que cambiar el nombre del ```init.lua``` a otro nombre diferente y el nombre de ```init.lua.old``` a ```init.lua```, para hacer que Neovim lea de este archivo.
