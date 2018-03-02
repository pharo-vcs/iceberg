accessing
packageState
	| currentCommits |
	
	"This method receives the head commit argument as an optimization.
	Asking for the head commit is expensive so the caller may (if he knows what he's doing) obtain the head commit only once and use it multiple times."
	
	self isLoaded
		ifFalse: [ ^ IceNotLoadedPackage package: self ].

	(self currentCommits anySatisfy: [:e | e isNoCommit ])
		ifTrue: [ ^ IceNewPackage package: self ].

	currentCommits := self currentCommits.
	currentCommits size > 1
		ifTrue: [ ^ IceInMergePackage package: self ].
	
	(currentCommits first repository = repository)
		ifFalse: [ ^ IceForeignPackage package: self ].
	
	^ currentCommits first packageStatusForPackage: self