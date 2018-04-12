testing
isAvailableFor: aRepository
	"matches if: 
		- workingCopy referenceCommit isUnknownCommit"
	^ aRepository workingCopy referenceCommit isUnknownCommit