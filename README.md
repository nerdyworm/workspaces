# Simple window mover

A simple tool to arrange windows in ubuntu with a width, height, x, y.

No fancy stuff.

## Usage
  Copy the ruby script into your $PATH i.e.
    $ cp workspaces.rb ~/bin/workspace

  The config file is placed in ~/.workspaces.yml

  sample.yml:
    workspace-name:
      window-class-name:
        w: 300
        h: 300
        x: 0
        y: 0
      window-class-name-two:
        w: 300
        h: 300
        x: 0
        y: 0

  usage:
    $ workspace rails # rails is the workspace name
    Arranging workspace: rails
    $
