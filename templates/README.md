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

List available templates with `nix flake show ~/dev/configs/nix-config`.

Note: in a git repo, `flake.nix` must be `git add`ed before `nix develop` can see it.

## Large shells (e.g. python-pytorch)

A plain `nix develop` shell isn't protected from garbage collection, so
`task garbage-cleanup` will delete it and the next run re-downloads everything
(several GB for ROCm). Use a profile to protect the shell from GC:

``` bash
nix develop --profile .nix-profile
```

Add `.nix-profile*` to the project's `.gitignore`. Delete it to let the shell be collected.
