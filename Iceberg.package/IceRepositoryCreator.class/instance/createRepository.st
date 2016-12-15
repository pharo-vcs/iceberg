actions
createRepository
	| backend locationToUse |
	
	self validate.

	locationToUse := self locationToUse.
	backend := (self storageClass 
		newRepositoryAt: locationToUse
		subdirectory: self subdirectory).
	self branchName ifNotNil: [ backend branch: self branchName ].

	(locationToUse exists not or: [ locationToUse hasChildren not ])
		ifTrue: [ backend cloneRepositoryFrom: self remoteToUse ].

	^ IceRepository backend: backend