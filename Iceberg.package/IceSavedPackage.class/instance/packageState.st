accessing
packageState
	
	| currentCommit |
	self isLoaded
		ifFalse: [ ^ IceNotLoadedPackage package: self ].
		
	(repository head packages includes: self)
		ifFalse: [ ^ IceNewPackage package: self ].

	currentCommit := self currentCommit.
	
	currentCommit = repository head commit
		ifTrue: [ ^ IceSynchronizedPackage package: self ].
	
	(currentCommit repository = repository)
		ifTrue: [ ^ IceDetachedPackage package: self ].
	
	"Current commit is either an IceNoCommit or a commit from another repository (And we are losing the history!)"	
	^ IceForeignPackage package: self