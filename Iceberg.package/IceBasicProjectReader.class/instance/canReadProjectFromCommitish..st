testing
canReadProjectFromCommitish: aCommitish
	
	^ (aCommitish fileSystem / '.project') exists