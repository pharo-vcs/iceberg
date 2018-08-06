testing
isAvailableFor: aRepository
	"matches if: 
		- workingCopy is detached
		- HEAD is detached"
	
	aRepository isMissing ifTrue: [ ^ false ].
	aRepository workingCopy referenceCommit isUnknownCommit ifTrue: [ ^ false ].
	aRepository workingCopy referenceCommit isNoCommit ifTrue: [ ^ false ].
	
	^ aRepository workingCopy isDetached or: [ aRepository head isDetached ]