querying
ownVersionFor: package 
	^ self ownVersions 
		detect: [ :each | each packageName = package name ]
		ifNone: nil
