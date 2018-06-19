instance creation
fromCommitish: aCommitish
	| ref repository dir |
	repository := aCommitish repository.
	dir := repository subdirectory isEmptyOrNil
		ifTrue: [ aCommitish fileSystem ]
		ifFalse: [ aCommitish fileSystem / repository subdirectory ].
	ref := dir / self propertiesFileName.
	ref exists ifFalse: [ ^ Dictionary new ].
	
	^ self fromFileReference: ref