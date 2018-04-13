testing
isAvailableFor: aRepository
	"matches if: 
		- workingCopy referenceCommit isUnknownCommit"
		
	^ aRepository isMissing not 
		and: [ aRepository workingCopy referenceCommit isUnknownCommit ]