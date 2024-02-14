
# FAQ

***Q.** The Image seems to freeze when doing a clone of a repository.*  
**A.** This is because the operation is taking time and Iceberg still does not show feedback properly. You just need to be patient :)  

***Q.** The Image freezes when cloning/committing and there is nothing I can do to fix it. I used HTTPS as the protocol when doing the clone.*  
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

***Q.** I'm on Windows and I got an error saying it cannot "stat file" when trying to clone a repo or load a Metecello configuration.*  
**A.** This is a known error in Windows with it's support paths, it fails when a path gets bigger then 256 characters. So if you clone a >256 char path git repo using Iceberg, this error will prompt. This happens too if you load a Metecello configuration that creates git repos with long paths. So if you use PharoLauncher be aware that it stores images on the User/Documents/Pharo/Images by default, and then Iceberg will store git repos loaded from Metacello inside another deeper sub-path structure, chances are that you will get this problem. Even enabling long paths support on Windows 10 won't work because Libgit haven't implemented support for this yet ([https://github.com/libgit2/libgit2/issues/3053]) and it isn't likely to be fixed soon. So the solution is to avoid long paths by either choosing a shallow path structure to clone your project through Iceberg and/or by changing the location where PharoLauncher store images to a shallow path.