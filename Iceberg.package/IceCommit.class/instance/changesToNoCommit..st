private-changes
changesToNoCommit: anIceNoCommit 
	
	^ self packages collect: [ :each | IceMemoryChange on: each ]