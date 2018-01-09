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
	
	^ currentCommit packageStatusForPackage: self