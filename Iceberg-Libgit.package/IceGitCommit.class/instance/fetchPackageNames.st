accessing
fetchPackageNames

	| writerClass dir |
	writerClass := self writerClass.
	dir := self fileSystem resolve: (self project sourceDirectory).
		
	dir exists ifFalse: [ ^ #() ].
	
	^ dir children
		select: [ :each | writerClass isValidPackageFileReference: each ]
		thenCollect: [ :each | writerClass packageNameFromDirectoryName: each basename ]