accessing-monticello
currentCommitsOfPackageNamed: aString 
	
	| ancestors |
	ancestors := (MCPackage named: aString) workingCopy ancestors.
	ancestors ifEmpty: [ ^ IceNoCommit repository: repository ].
	
	^ ancestors collect: [ :mcVersionInfo |.
		"Monticello versions loaded by iceberg are IceMCVersionInfo.
		IceMCVersionInfo know the iceberg commit used to load the package.
		In case we have one of those, use it.
		Otherwise, we cannot recognized the commit"	
		(mcVersionInfo respondsTo: #commit)
			ifTrue: [ mcVersionInfo commit ]
			ifFalse: [ IceNoCommit repository: repository ] ]