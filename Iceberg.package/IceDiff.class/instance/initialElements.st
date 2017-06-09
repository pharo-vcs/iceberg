initialization
initialElements
	| changedPackages |
	changedPackages := self myVersion changedPackagesTo: self theirVersion.
	^ changedPackages collect: [ :package | self createChangeSetFor: package ]