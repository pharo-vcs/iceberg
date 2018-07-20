testing
canReadProjectFromCommitish: aCommitish
	
	^ aCommitish isWorkingCopy not
		and: [ (aCommitish fileSystem / '.project') exists not ]