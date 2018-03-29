API-changes
isModified
	
	^ self loadedPackages anySatisfy: [ :e | e isDirty ]