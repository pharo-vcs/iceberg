testing
isAvailableFor: aRepository
	"matches if: 
		- workingCopy is atached
		- workingCopy project isUnborn"
	
	^ aRepository isMissing not  
		and: [  aRepository workingCopy isDetached not
			and: [ aRepository head isDetached not
				and: [ aRepository workingCopy project isUnborn ] ] ]