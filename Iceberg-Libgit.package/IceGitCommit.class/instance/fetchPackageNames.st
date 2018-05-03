accessing
fetchPackageNames

	| writerClass dir |
	writerClass := self writerClass.
	dir := repository subdirectory isEmptyOrNil
		ifTrue: [ self fileSystem ]
		ifFalse: [ self fileSystem / repository subdirectory ].
		
	dir exists ifFalse: [ ^ #() ].
	
	^ dir children
		select: [ :each | writerClass isValidPackageFileReference: each ]
		thenCollect: [ :each | writerClass packageNameFromDirectoryName: each basename ]