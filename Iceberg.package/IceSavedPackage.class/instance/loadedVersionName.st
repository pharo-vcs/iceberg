*Iceberg-UI
loadedVersionName
	^ self isLoaded 
		ifTrue: [ self loadedVersion description ]
		ifFalse: ''