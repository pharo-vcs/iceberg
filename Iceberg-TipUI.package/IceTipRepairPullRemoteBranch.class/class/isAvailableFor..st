testing
isAvailableFor: aRepository
	"matches if: 
		- workingCopy is detached"
	^ aRepository workingCopy isDetached