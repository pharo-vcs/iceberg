testing
isAvailableFor: aRepository
	"matches if: 
		- workingCopy isDetached
		- HEAD isDetached NOT"
	^ (aRepository workingCopy isDetached) 
		and: [ aRepository head isDetached not ]