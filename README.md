# Git integration for Pharo
Iceberg is a set of tools that allows one to handle git repositories directly from a Pharo image. Right now we only support git, but Iceberg is designed to allow other code versioning systems in the future. The final aim of Iceberg is to become the default repository manager for Pharo-core, allowing for smoother and faster integration of contributions, as well as better branch and version management.

Please be aware that this is still an experimental tool, so you have to be careful. But we already have a few early adopters, so you are invited to try it and provide feedback.

To better understand Iceberg (or even this documentation), I recommend to read the wiki pages which explain (parts of) the [Iceberg and Git nomenclature](docs/Iceberg-glossary.md) 
[![Travis Build Status](https://travis-ci.org/pharo-vcs/iceberg.svg?branch=master)](https://travis-ci.org/pharo-vcs/iceberg)
[![Appveyor Build status](https://ci.appveyor.com/api/projects/status/github/pharo-vcs/iceberg?svg=true)](https://ci.appveyor.com/project/pharo-vcs/iceberg)  


## FAQ

***Q.** The Image seems to freeze when doing a clone of a repository.*  
**A.** This is because the operation is taking time and Iceberg still does not show feedback properly. You just need to be patient :)  

***Q.** The Image freezes when cloning/commiting and there is nothing I can do to fix it. I used HTTPS as the protocol when doing the clone.*  
**A.** There is a known bug around HTTPS and getting the credentials. We will fix this, but while waiting for the fix, you can work around the problem by:  
- Adding your credentials **before** doing any operation (go to `System Settings/Tools/Software Configuration Management/Iceberg/Plain credentials`)
- Just using the SSH protocol instead (but that option is not as easy on Windows).  

***Q.** I installed Iceberg and try to clone a project, but I'm getting the error message "LGit_GIT_ERROR no ssh-agent suitable credentials found".*  
**A.** Currently Iceberg SSH support just handles SSH/ssh-agent. You can fix this problem in two ways:  
- In the command line, run this: `ssh-add ~/.ssh/id_rsa` (macOS users may prefer to execute this: `ssh-add -K ~/.ssh/id_rsa`)
- Go to Iceberg settings `System Settings/Tools/Software Configuration Management/Iceberg/Use custom SSH keys` and add the path to your `id_rsa.pub` and `id_rsa` files there.  

***Q.** I'm on Linux and when I want to commit I get the message "LGit_GIT_ERROR: no error message set by libgit2."*  
**A.** Iceberg for Pharo6 on Linux requires a different version of the VM than the one that is provided by 
default (this **will** be the default on Pharo7). The easiest way to get this VM is to execute `curl get.pharo.org/vmT60 | bash`.  

***Q.** I'm using a server with a different SSH port and I'm getting a "connection timeout" when I'm trying to clone.*  
**A.** You need to use a different URL format than the default (the one that is proposed on most sites). You need a URL that looks like this template: ` ssh://git@url:port/team/project.git`.

***Q.** I'm using Iceberg on Windows - whilst trying to clone a repository I get the error "LGit_GIT_ERROR: error authenticating: failed connecting agent".*  
**A.** Prompting for credentials currently doesn't work on Windows (we can't use ssh-agent).  You need to setup authentication using SSH keys.  Something like this:
```Smalltalk
IceCredentialsProvider useCustomSsh: true.
IceCredentialsProvider sshCredentials
	publicKey: 'c:\path\to\ssh\id_rsa.pub';
	privateKey: 'c:\path\to\ssh\id_rsa'
```

(Your key should not have a passphrase)

***Q.** I'm using 2FA on github and when I try to to create a PR from Iceberg, I'm asked a login/passwd. I try to login but it doesn't work.*
**A.** There is no support for 2FA in Iceberg for the moment. Please create a personal Access Tokens to replace your password in order to avoid this problem: https://github.com/settings/tokens

## Installation (for development)
### Prerequisites
- Latest Pharo 6.1+ image.
- Pharo VM for Pharo 6.1+.

You can get both by downloading it from the [Pharo](http://pharo.org) site or in the command line with [zeroconf](http://get.pharo.org): 

```Shell
wget -O- get.pharo.org | bash
```

### Install Iceberg
Since Pharo 6.0, Iceberg is included in the Image, so you probably will need to update rather than install (see below).

### Update Iceberg
Pharo 7.0a comes with the latest stable Iceberg version. To update it, just clone Iceberg into your repo and then pull the changes.

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
  	repository: 'github://pharo-vcs/iceberg:v1.?';
	onWarningLog;
  	load.
"Re-initialize libgit2"
(Smalltalk at: #LGitLibrary) initialize.

"In some case Pharo/Calypso can have a problem with Obsolete classes. If you encounter this problem just execute this command and retry your action:

Smalltalk compilerClass recompileAll

"
```

*NOTE: you need to update Iceberg in a NEW image, otherwise there will be obsolete repositories around.*

## 5 minutes tutorial
*(the 5 minutes tutorial is no longer valid for this version, we are working on an updated version)*

Have a look at the videos [https://github.com/pharo-vcs/iceberg/tree/master/docs/Contribute-to-Pharo-with-Iceberg-0.7.3]
