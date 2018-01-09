accessing
packageState
	
	| currentCommits currentCommit |
	self isLoaded
		ifFalse: [ ^ IceNotLoadedPackage package: self ].
		
	(repository head packages includes: self)
		ifFalse: [ ^ IceNewPackage package: self ].

	currentCommits := self currentCommits.
	currentCommits size > 1
		ifTrue: [ ^ IceInMergePackage package: self ].
	
	currentCommit := currentCommits first.
	currentCommit = repository head commit
		ifTrue: [ ^ IceSynchronizedPackage package: self ].
	
	^ currentCommit packageStatusForPackage: self