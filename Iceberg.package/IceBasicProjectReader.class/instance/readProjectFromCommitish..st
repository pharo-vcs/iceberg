reading
readProjectFromCommitish: anIceCommitish 

	(anIceCommitish fileSystem / '.project') exists
		ifFalse: [ ^ IceUnbornProject onProperties: Dictionary new commitish: anIceCommitish inRepository: anIceCommitish repository ].

	^ IceBasicProject
		fromFileReference: (anIceCommitish fileSystem / '.project')
		commitish: anIceCommitish
		inRepository: anIceCommitish repository