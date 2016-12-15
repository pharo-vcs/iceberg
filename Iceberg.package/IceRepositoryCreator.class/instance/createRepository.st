actions
createRepository
	| backend |
	
	self validate.
	
	backend := (self storageClass 
		newRepositoryAt: self locationToUse
		subdirectory: self subdirectory).
	self branchName ifNotNil: [ backend branch: self branchName ].

	(self location exists not or: [ self location hasChildren not ])
		ifTrue: [ backend cloneRepositoryFrom: self remoteToUse ].

	^ IceRepository backend: backend