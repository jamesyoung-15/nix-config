# Dev Shell Templates

Flake templates for per-project development shells.

## Usage

From inside a project directory:

``` bash
# copy a template's flake.nix into the current directory
nix flake init -t ~/dev/nix-config#python
# or straight from GitHub
nix flake init -t github:jamesyoung-15/nix-config#python

# enter the shell (creates flake.lock on first run, commit it with the project)
nix develop
```

List available templates with `nix flake show ~/dev/nix-config`.

Note: in a git repo, `flake.nix` must be `git add`ed before `nix develop` can see it.
