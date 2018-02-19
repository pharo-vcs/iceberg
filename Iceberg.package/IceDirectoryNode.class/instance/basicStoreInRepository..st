storing
basicStoreInRepository: aRepository
	
	"I represent a directory, I have to ensure that the directory is there"
	^ self fileReference ensureCreateDirectory