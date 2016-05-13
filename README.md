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
  repository: 'github://npasserini/pharo-git';
  onConflict: [:ex | ex allow];
  load.
```

## Usage
### Basic repository handling.
The first thing you need is a reference to a repository, for example:
```
  myRepo := Git new origin: 'git@github.com:npasserini/pharo-git.git'
```

If you want to checkout specific branch you can do:
```
  myRepo branch: 'newBranchName'
```

Please note that this will create a directory with the same name as your
repository in your image directory. Right now you can not use an already existing
local repository. Moreover, if a repository in that directory already exists,
your selected branch has to match the currently checked out branch of such repository.
In the future we plan to avoid using repositories on disk.

To the moment there is no registry of the repositories, you can keep your repository
or you can re-create it any time you need, it will have no side-effect.

### Manage branches
If afterwards you want to checkout another branch, you can do:
```
  myRepo checkoutBranch: 'anotherBranch'
```

or if you want to create a new branch
```
  myRepo createBranch: 'newBranchName'
```

### Load a package from a repository
```
  myRepo loadPackage: 'Package-Name'
```

### Commit your changes
After making some changes, you can use the IceSynchronizer to commit them:
```
  IceSynchronizer new
    changeSet: (IceWorkingCopyDiff forRepository: myRepo);
    openWithSpec.
```

Currently it is not possible to cherry pick your commits, all changes in the
repository will be commited.
