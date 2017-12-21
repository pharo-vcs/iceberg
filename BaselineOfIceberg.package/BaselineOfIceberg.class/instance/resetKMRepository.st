script
resetKMRepository
	Smalltalk 
		at: #KMRepository 
		ifPresent: [ :class | class reset ]