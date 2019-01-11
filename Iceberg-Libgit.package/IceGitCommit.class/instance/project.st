API-project
project

	self flag: #todo. "This is a quick fix for issue https://github.com/pharo-vcs/iceberg/issues/1002 and this should probably be improved to also cover issue https://github.com/pharo-vcs/iceberg/issues/949
	
	The idea is that if Iceberg contains a project at a certain commit and is associated to a local repository without the commit (because the image comes from a CI for example and the local repository is not in synch), we try to fetch the repository because the commit might be in the remote. This should cover most of the cases but might still fail if, for example, the local repository has different remotes than the one used where the repository was added to the image.
	
	This is a quick fix of the issue for Pharo 7 release."

	^ [ IceProjectReader readProjectFrom: self ] on: NotFound do: [ self repository fetch. IceProjectReader readProjectFrom: self ]