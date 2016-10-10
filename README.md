# Git integration for Pharo
Iceberg is a set of tools that allow to handle git repositories directly from the Pharo image. Right now we support only git, but Iceberg is designed to allow other code versioning systems in the future. The final aim of Iceberg is to become the default repository for Pharo-core, allowing for smoother and faster integration of contributions, as well as better branch and version management.

This is still a prototype and is not yet ready for production, but you are invited to try it and provide feedback. Right now it has been tested in linux and mac environments, it would be great if you can share your experience using Iceberg on your Windows computer.

## Instalation (for development)
### Prerequisites
- Latest Pharo 6.0 image.
- Git v1.9.1 or later (we are working to remove this requirement in the near future)
- An [SSH Key](https://help.github.com/articles/generating-an-ssh-key/) (again, not far from now this will not be mandatory any more ... but in this case I would still recommend to use an SSH Key as the preferred way to authenticate to your Github account.)

### Install Iceberg
```
Metacello new
  baseline: 'Iceberg';
  repository: 'github://npasserini/iceberg:stable';
  load.
```

### Update Iceberg
If you have downloaded a previous version of Iceberg, and you want to update it, you can do:
```
Iceberg update
```

**Important**
- You don't need this step if you have just downloaded Iceberg.
- Update is comfortable, but please note that it is just an **experimental feature**. Building a software that is able to update itself in a 100% safe way is far beyond the scope of the Iceberg project. The safest way is always start with a clean image.

## Usage
### Repositories Browser
The main entry point to Iceberg is the *Repositories Browser*. After installing Iceberg you will see a new entry on Pharo menu, below 'Tools' submenu, called Iceberg, which will open the browser.

![image](https://cloud.githubusercontent.com/assets/4633913/16365789/ac446d00-3c0a-11e6-83e0-976b00cbc0fb.png)

This tool shows you all known Iceberg repositories, allowing you to clone new repositories, import existing local repositories or forget repositories.  
It it is the main entrance point to every action to a repository, such as
- *Synchronize* a repository (see 'Synchronize Repository' section).
- Browse repository history (see 'Browse history' section).
- Switch between branches or create new branches.
- In absence of local changes or conflicts, you also can pull/push from the pop up menu.

You can find a more detailed description of the repositories browser [here](../../wiki/Repositories-Browser)

### Synchronize repository
The *Synchronizer window* allows to manage the code in a repository. The synchronization process involves three steps and the synchronizer window has one tab for each of them.

#### 1. Commit your changes
The first step is save the changes in the image onto your local repository, creating a new *commit*. This view will allow you to browse the changes you have made, and create a new commit. One such commit can (and probably will) include newer versions for several packages in the same repository (even when currently Iceberg will create a new commit for each package).

Right now Iceberg commits all the changes you have made to the packages in the selected repository, in the future we will add *cherry-picking* functionality.

#### 2. Update
After your changes are saved to your local repository, you should update your repository with eventual commits coming from remote repository(ies), and possibly merge those changes with your own work, before being able to share your code with others.

If you are familiar with git you probably know several ways to do this, including operations such as *fetch*, *pull*, *merge*, *rebase*, and others. Iceberg will download (*fetch*) the new commits automatically, show the changes between them and your current working copy and allow you to decide which of them you want to load in your image.

Right now Iceberg has no capabilities to resolve merging conflicts between the incomming changes and your own changes. (We partially rely on git automatic merge capabilities, and in case that is not enough you can revert to classical Pharo merge tools, because Iceberg exposes Monticello-compatible package versions.

#### 3. Publish
Once your local repository contains updated and merged commits, you can *push* them to the remote repository.

Right now this is ths simplest of the three views, you can only push all of your commits to the remote repository (no *cherry-picking* of commits) and browsing the changes at this stage is still not implemented.

## Iceberg API
### Creating and retreiving repositories.
Example:
```
  myRepo := IceRepository origin: 'git@github.com:npasserini/pharo-git-test.git'.
```

### Local storage of a repository
When the repository gets first used, it will create a local clone in your disk.
> By default clones are created in ./iceberg-cache directory, but the idea is that you should not care about it.
> In the future we would like to avoid having local working copies on disk.

If you prefere to do clones at specific locations, you can provide a directory:
```
  myRepo := IceRepository new
    origin: 'git@github.com:npasserini/iceberg.git';
    localDirectory: ... absolute or relative path
```

Or, if you already have a local repository, you can avoid setting the origin, it will be inferred for you.
```
  myRepo := IceRepository new localDirectory: ... absolute or relative path
```

If a local repository already exists at the same location we will get all necessary information from it (for example: remote origin and current checked out branch).

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

### Update packages
- `myRepo pull` will update all the packages in the repo (that have already been loaded).
- To update an individual package you can write: `myRepo updatePackage: 'Some-Package-Name'`

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
