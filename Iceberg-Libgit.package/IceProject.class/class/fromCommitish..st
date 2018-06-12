instance-creation
fromCommitish: anIceCommitish
	
	(anIceCommitish fileSystem / '.project') exists
		ifFalse: [ ^ IceUnbornProject onRepository: anIceCommitish repository ].

	^ self new
		commitish: anIceCommitish;
		yourself