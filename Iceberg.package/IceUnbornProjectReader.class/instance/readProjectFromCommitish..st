reading
readProjectFromCommitish: anIceCommitish

	^ IceUnbornProject
		onProperties: Dictionary new
		commitish: anIceCommitish