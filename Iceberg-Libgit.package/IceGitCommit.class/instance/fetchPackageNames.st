accessing
fetchPackageNames

	| writerClass dir |
	writerClass := self writerClass.
	dir := self fileSystem resolve: (self project sourceDirectory).
		
	dir exists ifFalse: [ ^ #() ].
	
	^ dir children
		select: [ :each | writerClass isValidPackage: each ]
		thenCollect: [ :each | writerClass packageNameFromDirectory: each ]