API-changes
modifiedPackages

	^ self loadedPackages select: [ :e | e isDirty ]