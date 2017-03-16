actions
createRepository
	| backend locationToUse |
	
	self validate.

	locationToUse := self locationToUse.
	backend := self storageClass 
		newRepositoryAt: locationToUse
		subdirectories: self subdirectories.

	(locationToUse exists not or: [ locationToUse hasChildren not ])
		ifTrue: [ 
			backend 
				cloneRepositoryFrom: self remoteToUse 
				branch: self branchName ].

	^ IceRepository backend: backend