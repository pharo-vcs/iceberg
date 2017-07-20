instance creation
fromArray: anArray
	^ self 
		major: anArray first 
		minor: anArray second 
		patch: anArray third