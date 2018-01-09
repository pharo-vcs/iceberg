accessing-monticello
currentCommitOfPackageNamed: aString 
	
	| ancestors mcVersionInfo |
	ancestors := (MCPackage named: aString) workingCopy ancestors.
	ancestors ifEmpty: [ ^ IceNoCommit repository: repository ].
	
	self assert: ancestors size = 1.
	mcVersionInfo := ancestors first.

	"Monticello versions loaded by iceberg are IceMCVersionInfo.
	IceMCVersionInfo know the iceberg commit used to load the package.
	In case we have one of those, use it."	
	(mcVersionInfo respondsTo: #commit)
		ifTrue: [ ^ mcVersionInfo commit ].


	"Otherwise, we cannot recognized the commit"
	^ IceNoCommit repository: repository