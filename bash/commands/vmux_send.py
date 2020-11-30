import sys
import os

import neovim

nvim = neovim.attach('socket', path=os.environ['VMUX_SERVER_FILE'])
nvim.command(" ".join(sys.argv[1:]))
