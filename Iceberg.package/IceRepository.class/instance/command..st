repository handling
command: aCommandDescription
	"This should be avoided and replaced by more specific options to the bare repository"
	self ensureLocalRepository.
	^ self repository command: aCommandDescription 
