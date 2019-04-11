instance creation
readProjectFrom: anIceCommitish
	^ (self availableReaders
		detect: [ :any | any canReadProjectFromCommitish: anIceCommitish ])
			readProjectFromCommitish: anIceCommitish