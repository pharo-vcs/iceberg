accessing
branchNameWithCommitId
	| branchName |
	branchName := self branchName.
	^ branchName = 'Detached' 
			ifTrue: [ '{1} at {2}' format: { self branchName. self shortCommitId } ]
			ifFalse: [branchName ]