acessing
loadedVersionName
	^ self isLoaded 
		ifTrue: [ self package loadedVersion description ]
		ifFalse: ''