instance-creation
fromCommitish: anIceCommitish

	(anIceCommitish fileSystem / '.project') exists
		ifFalse: [ ^ IceUnbornProject onProperties: Dictionary new commitish: anIceCommitish inRepository: anIceCommitish repository ].

	^ self
		fromFileReference: (anIceCommitish fileSystem / '.project')
		commitish: anIceCommitish
		inRepository: anIceCommitish repository