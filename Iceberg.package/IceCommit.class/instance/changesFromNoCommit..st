private-changes
changesFromNoCommit: anIceNoCommit 

	^ self packages collect: [ :each | IceMemoryChange on: each ]