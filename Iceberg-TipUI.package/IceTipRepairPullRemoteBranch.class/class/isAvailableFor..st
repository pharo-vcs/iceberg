testing
isAvailableFor: aRepository
	"matches if: 
		- workingCopy is detached AND there is no commit in the current available commits"

	aRepository isMissing ifTrue: [ ^ false ].
	aRepository workingCopy referenceCommit isUnknownCommit ifTrue: [ ^ false ].
	aRepository workingCopy referenceCommit isNoCommit ifTrue: [ ^ false ].

	^ aRepository workingCopy isDetached and: [ (aRepository includesCommit: aRepository workingCopy referenceCommit) not ]