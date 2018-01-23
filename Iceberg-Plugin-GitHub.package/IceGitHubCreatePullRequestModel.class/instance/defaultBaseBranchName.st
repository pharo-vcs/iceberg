accessing
defaultBaseBranchName
	self hasParent ifFalse: [ ^ self baseDefaultBranchName ].
	^ self baseBranchNames 
		detect: [ :each | each = self branch shortname ] 
		ifNone: [ self baseDefaultBranchName ]