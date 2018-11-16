API-accessing
lookupHead
	self handleLibgitError: [ | head |
		self repositoryHandle isUnborn
			ifTrue: [ ^ IceGitUnbornBranch inRepository: self ].
		head := self repositoryHandle head.
		^ head isBranch
			ifTrue: [ self basicNewBranchNamed: head name ]
			ifFalse: [ head object asIcebergObjectInRepository: self ] ]