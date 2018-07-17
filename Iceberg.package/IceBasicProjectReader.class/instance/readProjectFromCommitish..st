reading
readProjectFromCommitish: anIceCommitish 

	^ IceBasicProject
		fromFileReference: (anIceCommitish fileSystem / '.project')
		commitish: anIceCommitish
		inRepository: anIceCommitish repository