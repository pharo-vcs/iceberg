# Git integration for Pharo

## Instalation (for development)

### Install Dependencies
```
Metacello new
  baseline: 'Metacello';
  repository: 'github://dalehenrich/metacello-work:master/repository';
  get.

Metacello new
  baseline: 'Metacello';
  repository: 'github://dalehenrich/metacello-work:master/repository';
  onConflict: [:ex | ex allow];
  load.

Metacello new
  baseline: 'FileTree';
  repository: 'github://npasserini/filetree:pharo5.0_dev/repository';
  onConflict: [:ex | ex allow];
  load: 'Git'.

Metacello new
  baseline: 'FileTree';
  repository: 'gitfiletree://github.com/npasserini/filetree:pharo5.0_dev/repository';
  onConflict: [:ex | ex allow];
  load: 'Git Tests'.
```

### Install pharo-git
 1. Create 'Remote git repository' on Monticello browser pointing to `git@github.com:npasserini/pharo-git.git`

 2. Load latest version

## How to play around with it
### Load a package from a repository
```
  Git new
    origin: 'git@github.com:npasserini/pharo-git-test.git';
    loadPackage: 'Pharo-Git-Test'.
```
