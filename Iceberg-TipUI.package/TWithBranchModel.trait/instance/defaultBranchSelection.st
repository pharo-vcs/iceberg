accessing
defaultBranchSelection
	^ self branchModels
		detect: #isHead
		ifNone: [ self hasBranches
				ifTrue: [ self branchModels ifNotEmpty: #anyOne ] ]