testing
canReadProjectFromCommitish: aCommitish
	
	^ aCommitish commit = aCommitish repository headCommit
		and: [ (aCommitish fileSystem / '.project') exists not ]