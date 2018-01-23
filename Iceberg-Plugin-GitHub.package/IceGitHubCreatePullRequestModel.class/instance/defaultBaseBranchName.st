accessing
defaultBaseBranchName
	self hasParent ifFalse: [ ^ self baseDefaultBranchName ].
	^ self baseBranchNames 
		detect: [ :each | each = self branch basename ] 
		ifNone: [ self baseDefaultBranchName ]