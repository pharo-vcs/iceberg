testing
isAvailableFor: aRepository
	"matches if: 
		- workingCopy is detached
		- HEAD is NOT detached"
	^ (aRepository workingCopy isDetached) 
		and: [ aRepository head isDetached not ]