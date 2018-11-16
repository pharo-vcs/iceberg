API-changes
isModified
	^ self project isDirty or: [ self loadedPackages anySatisfy: [ :e | e isDirty ] ]