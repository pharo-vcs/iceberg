accessing
lookupHead
	| head |
	self repositoryHandle isUnborn
		ifTrue: [ ^ IceUnbornBranch inRepository: self ].
	head := self repositoryHandle head.
	^ head isBranch
		ifTrue: [ self basicNewBranchNamed: head name ]
		ifFalse: [ head object asIcebergObjectInRepository: self ]