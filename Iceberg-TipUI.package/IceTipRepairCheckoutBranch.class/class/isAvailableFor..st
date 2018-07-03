testing
isAvailableFor: aRepository
	"matches if: 
		- workingCopy is detached
		- HEAD is detached"
	
	^ aRepository project isUnbornProject
		or: [ aRepository isMissing not
			and: [ 
				aRepository workingCopy isDetached 
					or: [ aRepository head isDetached ] ]]