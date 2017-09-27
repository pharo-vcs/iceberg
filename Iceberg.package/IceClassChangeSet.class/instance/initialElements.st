initialization
initialElements
	^ self changes collect: [ :each | each asIceChangeSet parent: self ]