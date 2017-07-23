I 'm a base class to resolve provider-based repositories.
A provider repositoy is composed of: 

provider://username/repository[:commitish][/subdir]

provider  	- The provider identifier (e.g. github, bitbucket, etc.)
username 	- The provider user
repository	- The provider repository
commitish	- an optional commitish (a branch, a tag, a commit id)
subdir		- an optional subdirectory where the packages exist.
		
Example: 
------------
A script to install voyage using this would like more or less like this:

Metacello new
	repository: 'github//pharo-nosql/voyage:master/mc';
	baseline: 'Voyage';
	load: 'mongo tests'.