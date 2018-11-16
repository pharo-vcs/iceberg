testing
isAvailableFor: aRepository
	"matches if: 
		- workingCopy is detached
		- HEAD is detached"

	^ aRepository isMissing not
		and: [ aRepository project isUnborn or: [ aRepository workingCopy isDetached or: [ aRepository head isDetached ] ] ]