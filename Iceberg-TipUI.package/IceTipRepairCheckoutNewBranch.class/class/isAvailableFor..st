testing
isAvailableFor: aRepository
	"matches if: 
		- workingCopy is detached
		- HEAD is detached"
	^ (aRepository workingCopy isDetached) 
		or: [ aRepository head isDetached ]