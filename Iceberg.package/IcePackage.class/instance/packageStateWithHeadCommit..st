accessing
packageStateWithHeadCommit: headCommit
	| currentCommits currentCommit |
	
	"This method receives the head commit argument as an optimization.
	Asking for the head commit is expensive so the caller may (if he knows what he's doing) obtain the head commit only once and use it multiple times."
	
	self isLoaded
		ifFalse: [ ^ IceNotLoadedPackage package: self ].
		
	(headCommit packages includes: self)
		ifFalse: [ ^ IceNewPackage package: self ].

	currentCommits := self currentCommits.
	currentCommits size > 1
		ifTrue: [ ^ IceInMergePackage package: self ].
	
	currentCommit := currentCommits first.
	currentCommit = headCommit
		ifTrue: [ ^ IceSynchronizedPackage package: self ].
	
	^ currentCommit packageStatusForPackage: self