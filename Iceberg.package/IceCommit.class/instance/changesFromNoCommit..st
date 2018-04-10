private-changes
changesFromNoCommit: anIceNoCommit 

	^ self packages collect: [ :each | IceImageChange package: each ]