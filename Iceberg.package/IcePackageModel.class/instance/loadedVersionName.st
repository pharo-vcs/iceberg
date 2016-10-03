acessing
loadedVersionName
	^ self package isLoaded 
		ifTrue: [ self package loadedVersion description ]
		ifFalse: ''