testing
readProjectFromCommitish: anIceCommitish

	^ IceUnbornProject
		onProperties: Dictionary new
		commitish: anIceCommitish
		inRepository: anIceCommitish repository
