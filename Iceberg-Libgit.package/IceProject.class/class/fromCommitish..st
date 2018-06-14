instance-creation
fromCommitish: anIceCommitish
	
	(anIceCommitish fileSystem / '.project') exists
		ifFalse: [ ^ IceUnbornProject onRepository: anIceCommitish repository ].

	^ self
		fromFileReference: (anIceCommitish fileSystem / '.project')
		inRepository: anIceCommitish repository