actions
createRepository
	| backend |
	
	self validate.
	
	backend := (self storageClass 
		newRepositoryAt: (self location ifNil: [ self defaultLocation ] )
		origin: (self remote ifNil: [ self defaultRemote ])
		subdirectory: self subdirectory).
	self branchName ifNotNil: [ backend branch: self branchName ].

	(self location exists not or: [ self location hasChildren not ])
		ifTrue: [ backend cloneRepository ].

	^ IceRepository backend: backend