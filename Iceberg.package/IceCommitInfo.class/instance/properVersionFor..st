querying
properVersionFor: package 
	^ (self ownVersionFor: package)
		ifNil: [ self lookupVersionFor: package ]
