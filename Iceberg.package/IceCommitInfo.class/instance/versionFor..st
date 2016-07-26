querying
versionFor: package 
	^ (self ownVersionFor: package)
		ifNil: [ self lookupVersionFor: package ]
