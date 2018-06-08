accessing
branchName
	| head |
	self entity isMissing ifTrue: [ ^ self class unknownBranchLabel ].
	
	head := self entity head.
	^ head isDetached
		ifTrue: [ 'Detached at {1}' format: { self shortCommitId } ]
		ifFalse: [ head name ]