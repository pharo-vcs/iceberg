accessing
headModel
	
	| head |
	head := self entity head.
	^ head isBranch
		ifTrue: [ self branchModelFor: head ]
		ifFalse: [ self commitModelFor: head ]