# Git integration for Pharo
Iceberg is a set of tools that allow one to handle git repositories directly from a Pharo image. Right now we support only git, but Iceberg is designed to allow other code versioning systems in the future. The final aim of Iceberg is to become the default repository manager for Pharo-core, allowing for smoother and faster integration of contributions, as well as better branch and version management.

Please be aware this is still an experimental tool, so you have to be careful. But we have already a few early adopters, so you are invited to try it and provide feedback.

To better understand Iceberg (or even this documentation), I recommend to read the wiki pages which explain (parts of) the [Iceberg](../../wiki/Iceberg-glossary) and [Git](../../wiki/Some-keys-to-understand-Git-nomenclature) terminology.

## Installation (for development)
### Prerequisites
- Latest Pharo 6.0 image.
- Latest Pharo VM.
- NO LONGER NEEDED (Just for testing iceberg itself): Git v1.9.1 or later.

### Install Iceberg

```Smalltalk
Metacello new
  baseline: 'Iceberg';
  repository: 'github://pharo-vcs/iceberg';
  load.
```

### Update Iceberg
If you have downloaded a previous version of Iceberg, and you want to update it, you can do:
```Smalltalk
#('Iceberg-UI' 'Iceberg-Plugin' 'Iceberg-Metacello-Integration' 'Iceberg-Libgit' 'Iceberg' 'BaselineOfIceberg' 'LibGit-Core' 'BaselineOfLibGit') 
do: [ :each | each asPackage removeFromSystem ].

Metacello new
  baseline: 'Iceberg';
  repository: 'github://pharo-vcs/iceberg';
  load.
```

**Important**
- You don't need this step if you have just downloaded Iceberg.
- Update is comfortable, but please note that it is just an **experimental feature**. Building a software that is able to update itself in a 100% safe way is far beyond the scope of the Iceberg project. The safest way is always start with a clean image.

## 5 minutes tutorial
### Clone a repository
- Before using Iceberg you should have a git repository. If you do not have one, you can *create* or *fork* one on Github.

  > Please ensure that your repository is not empty (see [#127](https://github.com/pharo-vcs/iceberg/issues/127)). If you are creating one on Github you just selecting the option 'Initialize this repository with a README' will do the trick.

- Open the *Repositories Browser*, you can find on Pharo menu under 'Tools' or just type 'Iceberg' in Spotter. Normally you will see something like this:

  ![image](https://cloud.githubusercontent.com/assets/4633913/20836463/b9398eac-b89f-11e6-92c7-d0f6ed785c83.png)

  But if it is the first time you use Iceberg you might be looking at this:

  ![image](https://cloud.githubusercontent.com/assets/4633913/20835889/3a2c2914-b89d-11e6-96fa-c0ba1f16041b.png)

  So let's add a repository.

- The easiest way to create a new repository is by clicking on 'Clone new Repository'. You will see this dialog:

  ![image](https://cloud.githubusercontent.com/assets/4633913/20840028/27e57712-b8af-11e6-8b20-76c674afe21d.png)

  - Remote URL: This is the url we should use to clone your github project, it should be something like `git@github.com:pharo-vcs/iceberg.git` or `https://github.com/pharo-vcs/iceberg.git`.

    > **Tip:** If you do not know it, you can get it from github, look for the green "Clone or Download" button.

  - Local directory: You can just leave the default location for a start.

  - Code subdirectory: You should provide the name of a subdirectory inside of your repository inside which your code lies. Usual options are `mc` or `repository`. Leaving it empty means that the code is in the root of your repository, this is a valid choice too.

  - Click on 'Create repository', then you should see a new entry in the repositories browser.

### Add packages to your repository
- If your repository is new, you should add some packages to it.
  - First create a Pharo package in the usual way, it should have at least one class, and the class should have at least one method.
  - Then open the repositories browser and select your repository.
  - In the bottom right panel you will see the current packages in your repository.
  - Click on 'Add package' and select a package.

### Your first commit
- After adding a package or modifying some code in one of the packages known to your repository, you are ready to *commit* your changes.
  - Open the Repositories Browser
  - You should see that your repository name is highlighted in green, and its status changed to 'Uncommited changes'.
  - From the contextual menu of your repository, select the 'Synchronize Repository' option. (Or you can also double-click on your repository). You should see something like this:

    ![image](https://cloud.githubusercontent.com/assets/4633913/20836730/eaf72804-b8a0-11e6-8f01-10a6ca25d41e.png)

    On the top-left panel, you will see all changes to the packages stored in the repository, by selecting a method on the changes tree you will see the differences in the bottom panel.

    > **Please be aware that current Iceberg version has a bug and shows your version in red, while the original version is shown in green.**.

  - From the contextual menu of the tree, you can also *revert* a change, or *browse* the changed method/class.
  - If you make more changes after opening the synchronize view, you have to click on *Refresh tree* to see the new changes.
  - After you are comfortable with your you can commit.
    - First enter a suitable message in the top right panel, under 'Commit changes'.
    - Then click on the 'Commit' button.

  - By default Iceberg will try to immediately *push* your commits to your remote repository. If you do not want that you can uncheck the 'Upload changes on commit' option. If you do so, your changes will be saved only in the local repository, and you can push them later.

  - Whenever you decide to push your commits, Iceberg will require your github credentials. Currently Iceberg (in its default configuration) can not use SSH keys to connect to github, so you will have to provide your github user and password.

    > By default, these credentials will be saved to avoid requiring them each time, but **be aware that this is is not a really safe option**.

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

You can find a more detailed description of the Repositories Browser in its [wiki page](../../wiki/Repositories-Browser)

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
  myRepo := IceRepository origin: 'git@github.com:pharo-vcs/pharo-git-test.git'.
```

### Local storage of a repository
When the repository gets first used, it will create a local clone in your disk.
> By default clones are created in ./iceberg-cache directory, but the idea is that you should not care about it.
> In the future we would like to avoid having local working copies on disk.

If you prefere to do clones at specific locations, you can provide a directory:
```
  myRepo := IceRepository new
    origin: 'git@github.com:pharo-vcs/iceberg.git';
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
