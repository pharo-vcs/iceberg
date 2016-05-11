# Git integration for Pharo
This is only a prototype and is not yet ready for production, but you are invited to try it and provide feedback. Right now it has only been tested in a linux environment.

## Instalation (for development)
### Download latest pharo 5.0 image
```
curl get.pharo.org/50+vm | bash
./pharo-ui Pharo.image
```

### Install pharo-git
```
Metacello new
  baseline: 'Iceberg';
  repository: 'github://npasserini/pharo-git:repackaging';
  onConflict: [:ex | ex allow];
  load.
```

## How to play around with it
### Load a package from a repository
```
  Git new
    origin: 'git@github.com:npasserini/pharo-git-test.git';
    loadPackage: 'Pharo-Git-Test'.
```

### Open an IceSyncrhonizer
```
  IceExamples exampleSynchronizer
```
