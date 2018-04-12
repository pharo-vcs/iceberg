testing
isAvailableFor: aRepository
	"matches if: 
		- workingCopy is detached 
		- AND there is no commit in the current available commits"

	^ aRepository workingCopy isDetached
		and: [ (aRepository includesCommit: aRepository workingCopy referenceCommit) not ]