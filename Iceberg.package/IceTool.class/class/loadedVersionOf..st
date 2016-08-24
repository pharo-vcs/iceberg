utilities
loadedVersionOf: package
	^ package isLoaded 
		ifTrue: [ package loadedVersion description ]			
		ifFalse: [ '' ].

