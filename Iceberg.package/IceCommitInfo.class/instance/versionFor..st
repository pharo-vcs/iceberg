as yet unclassified
versionFor: package 
	^ (self ownVersionFor: package)
		ifNil: [ self lookupVersionFor: package ]
