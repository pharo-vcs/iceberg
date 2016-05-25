# Git integration for Pharo
This is only a prototype and is not yet ready for production, but you are invited to try it and provide feedback. Right now it has only been tested in a linux environment.

## Instalation (for development)
### Prerrequisites
- Latest Pharo 6.0 image.
- Git v1.9.1 or later
- An [SSH Key](https://help.github.com/articles/generating-an-ssh-key/)

### Install pharo-git
```
Metacello new
  baseline: 'Iceberg';
  repository: 'github://npasserini/pharo-git';
  onConflict: [:ex | ex allow];
  load.
```

## Usage
### Creating and retreiving repositories.
A repository is created out of an SCP URL (with the form `[user@]host:filename`, frequently `git@github.com:username/projectname.git`).
```
  myRepo := IceRepository origin: 'git@github.com:npasserini/pharo-git-test.git'.
```

### Local storage of a repository
When the repository gets first used, it will create a local clone in your disk.
> By default clones are created in ./iceberg-cache directory, but the idea is that you should not care about it.
> In the future we would like avoid having local working copies on disk.

If you prefere to do clones at specific locations, you can provide a directory:
```
  myRepo := IceRepository new
    origin: 'git@github.com:npasserini/pharo-git.git';
    localDirectory: ... absolute or relative path
```

Or, if you already have a local repository, you can avoid setting the origin, it will be inferred for you.
```
  myRepo := IceRepository new localDirectory: ... absolute or relative path
```

If a local repository already exists at the same location we will get all necessary information from it (for example: remote origin and current checkd out branch).

### Manage branches
By default repositories will checkout the 'master' branch. If you need to work with another branch you can do:
```
  myRepo checkoutBranch: 'anotherBranch'
```

If you want to create a new branch it is slight different:
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

From this window you can see the changes you are about to commit, and commit.
> Tip: Ctrl/Cmd + s on the commit message textarea will also commit.

Currently it is not possible to cherry pick your commits, all changes in the
repository will be commited.
