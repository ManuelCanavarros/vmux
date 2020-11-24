# VMUX

Helper to use neovim as a terminal multiplexer. build on top of abduco.

# install

First, you need to install [abduco](https://github.com/martanne/abduco).

Add and install the following vim plugin: 

```
Plug 'mcanavarros/vmux'
```

Then add the following to your .zshrc or .bashrc

```
source ~/.config/nvim/plugged/vmux/bash/setup_vmux.sh
```

# Usage

Run `vmux` for vmux command usage help
Run `:help vmux` from within vim for more in depth help.

# Detaching

You can detach from the session with ^\

# Acknowledgment
This project was forked from [yazgoo/vmux](https://github.com/yazgoo/vmux)
