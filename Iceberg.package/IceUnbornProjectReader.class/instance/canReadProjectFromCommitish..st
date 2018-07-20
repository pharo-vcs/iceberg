testing
canReadProjectFromCommitish: aCommitish
	
	^ aCommitish isWorkingCopy
		and: [ (aCommitish fileSystem / '.project') exists not ]