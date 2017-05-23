# Git integration for Pharo
Iceberg is a set of tools that allow one to handle git repositories directly from a Pharo image. Right now we support only git, but Iceberg is designed to allow other code versioning systems in the future. The final aim of Iceberg is to become the default repository manager for Pharo-core, allowing for smoother and faster integration of contributions, as well as better branch and version management.

Please be aware this is still an experimental tool, so you have to be careful. But we have already a few early adopters, so you are invited to try it and provide feedback.

To better understand Iceberg (or even this documentation), I recommend to read the wiki pages which explain (parts of) the [Iceberg](../../wiki/Iceberg-glossary) and [Git](../../wiki/Some-keys-to-understand-Git-nomenclature) terminology.

## Installation (for development)
### Prerequisites
- Latest Pharo 6.0 image.
- Latest Pharo VM.
	- **IMPORTANT FOR LINUX USERS:** For Pharo6, you need a special VM (it will be default for Pharo7), the "threaded hearbeat VM". You can download it by executing `curl get.pharo.org/vmT60 | bash`.
- NO LONGER NEEDED (Just for testing iceberg itself): Git v1.9.1 or later.

### Install Iceberg
We are in active development and too many things have changed, until we release an official stable version we recommend to install with following expression (version dev-0.4):

```Smalltalk
Metacello new
  baseline: 'Iceberg';
  repository: 'github://pharo-vcs/iceberg';
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

## 5 minutes tutorial
### Clone a repository
- Before using Iceberg you should have a git repository. If you do not have one, you can *create* or *fork* one on Github.

  > Please ensure that your repository is not empty (see [#127](https://github.com/pharo-vcs/iceberg/issues/127)). If you are creating one on Github you just selecting the option 'Initialize this repository with a README' will do the trick.

- Open the *Repositories Browser*, you can find on Pharo menu under 'Tools' or just type 'Iceberg' in Spotter. Normally you will see something like this:

  ![image](https://cloud.githubusercontent.com/assets/513630/25996638/9316c4fe-3718-11e7-91a6-dd2e1e5168bd.png)

  But if it is the first time you use Iceberg you might be looking at an empty list. 

  So let's add a repository.

- The easiest way to create a new repository is by clicking on 'Clone repository'. You will see this dialog:

  ![image](https://cloud.githubusercontent.com/assets/513630/25996645/9a441b3c-3718-11e7-95ea-8e7c71b91ece.png)

  - Remote URL: This is the url we should use to clone your github project, it should be something like `git@github.com:pharo-vcs/iceberg.git` or `https://github.com/pharo-vcs/iceberg.git` (**IMPORTANT:** HTTPS is not recommended for the moment, since it has problems with getting credentials. See [FAQ](#FAQ) section).

    > **Tip:** If you do not know it, you can get it from github, look for the green "Clone or Download" button.

  - Local directory: You can just leave the default location for a start.

  - Code subdirectory: You should provide the name of a subdirectory inside of your repository inside which your code lies. Usual options are `src`, `mc` or `repository`. Leaving it empty means that the code is in the root of your repository, this is a valid choice too.

  - Click on 'Create repository', then you should see a new entry in the repositories browser.

### Add packages to your repository
- If your repository is new, you should add some packages to it.
  - First create a Pharo package in the usual way, it should have at least one class, and the class should have at least one method.
  - Then open the repositories browser, select your repository and click on the "Packages" tab.
  - Click on 'Add package' and select a package.

### Your first commit
- After adding a package or modifying some code in one of the packages known to your repository, you are ready to *commit* your changes.
  - Open the Repositories Browser
  - You should see that your repository name is highlighted in green, and its status changed to 'Uncommited changes'.
  - From the contextual menu of your repository, select the 'Synchronize Repository' option. (Or you can also double-click on your repository). You should see something like this:

    ![image](https://cloud.githubusercontent.com/assets/513630/25996648/9cf5d442-3718-11e7-9f4d-fdb598c51f1e.png)

    On the top-left panel, you will see all changes to the packages stored in the repository, by selecting a method on the changes tree you will see the differences in the bottom panel.

  - From the contextual menu of the tree, you can also *revert* a change, or *browse* the changed method/class.
  - If you make more changes after opening the synchronize view, you have to click on *Refresh tree* to see the new changes.
  - After you are comfortable with your you can commit.
    - First enter a suitable message in the top right panel, under 'Commit changes'.
    - Then click on the 'Commit' button.

  - You can choose to just *commit* your changes or *commit and push*. There will be buttons available for both options.

## FAQ

Q. Image seems freeze when doing a clone of a repository.  
A. This is because operation is taking time and Iceberg still does not shows feedback properly. You just need to be patient :)  

Q. Image freezes when cloning/commiting and there is nothing I can do to fix it. I used HTTPS protocol to do the clone.  
A. There is a known bug around HTTPS and the get of credentials. We will fix this, but while waiting for the fix, you can workaround the problem by:  
- Adding your credentials **before** doing any operation (go to `System Settings/Tools/Software Configuration Management/Iceberg/Plain credentials`)
- Just using SSH protocol (but that option is not so easy on Windows).

Q. I installed iceberg and try to clone a project, but I'm getting "LGit_GIT_ERROR no ssh-agent suitable credentials found" error message.  
A. For the moment, iceberg SSH support for iceberg just handles SSH/ssh-agent. You can fix this problem two ways:  
- In command line, run this: `ssh-add ~/.ssh/id_rsa` (macOS users may prefer to execute this: `ssh-add -K ~/.ssh/id_rsa`)
- Go to iceberg settings `System Settings/Tools/Software Configuration Management/Iceberg/Use custom SSH keys` and add there the path to your `id_rsa.pub` and `id_rsa` files.

Q. I'm on linux and when I want to commit I have this message: "LGit_GIT_ERROR: no error message set by libgit2."  
A. Iceberg for Pharo6 on Linux requires a different version of the VM than the one that is provided by 
default (this **will** be the default on Pharo7). To get this VM, the easiest way is to execute `curl get.pharo.org/vmT60 | bash`.

## Usage
### Repositories Browser
The main entry point to Iceberg is the *Repositories Browser*. After installing Iceberg you will see a new entry on Pharo menu, below 'Tools' submenu, called Iceberg, which will open the browser.

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
```Smalltalk
myRepository := IceRepositoryCreator new 
	url: 'git@github.com:pharo-vcs/pharo-git-test.git';
	createRepository.
```

### Local storage of a repository
When the repository gets first used, it will create a local clone in your disk.
> By default clones are created in ./iceberg-cache directory, but the idea is that you should not care about it.
> In the future we would like to avoid having local working copies on disk.

If you prefere to do clones at specific locations, you can provide a directory:
```Smalltalk
myRepository := IceRepositoryCreator new
	url: 'git@github.com:pharo-vcs/iceberg.git';
	location: aFileReference; "... absolute or relative path"
	createRepository.
```

Or, if you already have a local repository, you can avoid setting the origin, it will be inferred for you.
```Smalltalk
myRepository := IceRepositoryCreator new 
	location: aFileReference; "... absolute or relative path"
	createRepository.
```

If a local repository already exists at the same location we will get all necessary information from it (for example: remote origin and current checked out branch).

### Manage branches
By default repositories will checkout the 'master' branch. If you need to work with another branch you can do:
```Smalltalk
myRepository checkoutBranch: 'anotherBranch'
```

If you want to create a new branch it is slight different:
```Smalltalk
myRepository createBranch: 'newBranchName'
```

### Load a package from a repository
```Smalltalk
myRepository loadPackage: 'Package-Name'
```

### Update packages
- `myRepository pull` will update all the packages in the repo (that have already been loaded).
- To update an individual package you can write: `myRepository updatePackage: 'Some-Package-Name'`

### Commit your changes
After making some changes, you can use the IceSynchronizer to commit them:
```Smalltalk
  IceSynchronizer new
    changeSet: (IceWorkingCopyDiff forRepository: myRepository);
    openWithSpec.
```

From this window you can see the changes you are about to commit, and commit.
> Tip: Ctrl/Cmd + s on the commit message textarea will also commit.

Currently it is not possible to cherry pick your commits, all changes in the
repository will be commited.
