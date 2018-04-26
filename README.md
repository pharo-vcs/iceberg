# Git integration for Pharo
Iceberg is a set of tools that allow one to handle git repositories directly from a Pharo image. Right now we support only git, but Iceberg is designed to allow other code versioning systems in the future. The final aim of Iceberg is to become the default repository manager for Pharo-core, allowing for smoother and faster integration of contributions, as well as better branch and version management.

Please be aware this is still an experimental tool, so you have to be careful. But we have already a few early adopters, so you are invited to try it and provide feedback.

To better understand Iceberg (or even this documentation), I recommend to read the wiki pages which explain (parts of) the [Iceberg](../../wiki/Iceberg-glossary) and [Git](../../wiki/Some-keys-to-understand-Git-nomenclature) terminology.

## FAQ

***Q.** Image seems freeze when doing a clone of a repository.*  
**A.** This is because operation is taking time and Iceberg still does not shows feedback properly. You just need to be patient :)  

***Q.** Image freezes when cloning/commiting and there is nothing I can do to fix it. I used HTTPS protocol to do the clone.*  
**A.** There is a known bug around HTTPS and the get of credentials. We will fix this, but while waiting for the fix, you can workaround the problem by:  
- Adding your credentials **before** doing any operation (go to `System Settings/Tools/Software Configuration Management/Iceberg/Plain credentials`)
- Just using SSH protocol (but that option is not so easy on Windows).  

***Q.** I installed iceberg and try to clone a project, but I'm getting "LGit_GIT_ERROR no ssh-agent suitable credentials found" error message.*  
**A.** For the moment, iceberg SSH support for iceberg just handles SSH/ssh-agent. You can fix this problem two ways:  
- In command line, run this: `ssh-add ~/.ssh/id_rsa` (macOS users may prefer to execute this: `ssh-add -K ~/.ssh/id_rsa`)
- Go to iceberg settings `System Settings/Tools/Software Configuration Management/Iceberg/Use custom SSH keys` and add there the path to your `id_rsa.pub` and `id_rsa` files.  

***Q.** I'm on linux and when I want to commit I have this message: "LGit_GIT_ERROR: no error message set by libgit2."*  
**A.** Iceberg for Pharo6 on Linux requires a different version of the VM than the one that is provided by 
default (this **will** be the default on Pharo7). To get this VM, the easiest way is to execute `curl get.pharo.org/vmT60 | bash`.  

***Q.** I'm using a server with an alternate SSH port and I'm receiving "connection timeout" when I'm trying to clone.*  
**A.** You need to use an different url format than default one (the one that is proposed in most sites). You need an url as this one: ` ssh://git@url:port/team/project.git`.

***Q.** I'm using Iceberg on Windows - whilst trying to clone a repository I receive the error "LGit_GIT_ERROR: error authenticating: failed connecting agent".*  
**A.** Prompting for credentials currently doesn't work on Windows (we can't use ssh-agent).  You need to setup authentication using ssh keys.  Something like so:

```Smalltalk
IceCredentialsProvider useCustomSsh: true.
IceCredentialsProvider sshCredentials
	publicKey: 'c:\path\to\ssh\id_rsa.pub';
	privateKey: 'c:\path\to\ssh\id_rsa'
```

(Your key should not have a passphrase)

## Installation (for development)
### Prerequisites
- Latest Pharo 6.1+ image.
- Pharo VM for Pharo 6.1+.

You can get both downloading it from [Pharo](http://pharo.org) site or in command-line with [zeroconf](get.pharo.org): 

```Shell
wget -O- get.pharo.org | bash
```

### Install Iceberg
Since Pharo 6.0, iceberg is included in the image, so you probably will need to update more than install (see below).

### Update Iceberg
Pharo 7.0a comes with latest stable Iceberg version, to update just clone iceberg in your repo and then pull changes.

#### For Pharo 6.1

```Smalltalk
MetacelloPharoPlatform select.
#(
    'BaselineOfTonel'
    'BaselineOfLibGit'
    'BaselineOfIceberg'
    'MonticelloTonel-Core'
    'MonticelloTonel-FileSystem'
    'MonticelloTonel-Tests'
    'Iceberg-UI' 
    'Iceberg-TipUI'
    'Iceberg-Plugin-Pharo' 
    'Iceberg-Plugin-Metacello' 
    'Iceberg-Plugin-GitHub' 
    'Iceberg-Plugin' 
    'Iceberg-Metacello-Integration' 
    'Iceberg-Libgit-Tonel' 
    'Iceberg-Libgit-Filetree' 
    'Iceberg-Libgit' 
    'Iceberg-Tests'
    'Iceberg-Memory'
    'Iceberg-UI-Tests'
    'Iceberg-Core' 
    'Iceberg-Changes' 
    'Iceberg-Adapters' 
    'Iceberg'
    'Iceberg-GitCommand'
    'Iceberg-SmartUI'
    'Iceberg-Pharo6'
    'LibGit-Core') 
do: [ :each | (each asPackageIfAbsent: [ nil ]) ifNotNil: #removeFromSystem ].
"update icons (iceberg needs some new)"
ThemeIcons current: ThemeIcons loadDefault.
"load iceberg"
Metacello new
  	baseline: 'Iceberg';
  	repository: 'github://pharo-vcs/iceberg:v0.7.?';
	onWarningLog;
  	load.
"Re-initialize libgit2"
(Smalltalk at: #LGitLibrary) initialize.
```

*NOTE: you need to update iceberg in a NEW image, otherwise there will be obsolete repositories around.*

## 5 minutes tutorial
*(the 5 minutes tutorial is no longer valid for this version, we are working on an updated version)*
