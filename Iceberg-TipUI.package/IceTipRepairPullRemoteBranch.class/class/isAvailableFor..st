testing
isAvailableFor: aRepository
	"matches if: 
		- workingCopy is detached AND there is no commit in the current available commits"

	^ aRepository isMissing not
		and: [ aRepository workingCopy isDetached
		and: [ (aRepository includesCommit: aRepository workingCopy referenceCommit) not ] ]