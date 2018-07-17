testing
canReadProjectFromCommitish: aCommitish
	
	^ aCommitish commit ~= aCommitish repository workingCopy referenceCommit
		and: [ (aCommitish fileSystem / '.project') exists not ]