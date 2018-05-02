instance creation
fromCommitish: aCommitish
	| ref properties repository dir |
	repository := aCommitish repository.
	dir := repository subdirectory isEmptyOrNil
		ifTrue: [ aCommitish fileSystem ]
		ifFalse: [ aCommitish fileSystem / repository subdirectory ].
	ref := dir / self propertiesFileName.
	properties := ref exists
		ifTrue: [ self readPropertiesFrom: ref ]
		ifFalse: [ Dictionary new ].
	^ (self fromDictionary: properties)
		repository: repository;
		yourself