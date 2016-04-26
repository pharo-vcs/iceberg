# Git integration for Pharo
This is only a prototype and is not intended for production, but you are invited to try it and provide feedback. Right now it has only been tested in a linux environment.

## Instalation (for development)
### Download latest pharo 5.0 image
```
curl get.pharo.org/50+vm | bash
./pharo-ui Pharo.image
```


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
