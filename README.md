# Simple window mover

I got really tired of lining up my windows and every other thing out
there just didn't seem to let me do the obvious things like provide a
widht, height, x, and y.  

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
