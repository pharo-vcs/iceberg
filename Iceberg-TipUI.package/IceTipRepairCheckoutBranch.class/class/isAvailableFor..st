testing
isAvailableFor: aRepository
	"matches if: 
		- workingCopy isDetached
		- HEAD isDetached"
	^ (aRepository workingCopy isDetached) 
		or: [ aRepository head isDetached ]