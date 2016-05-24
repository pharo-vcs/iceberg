accessing
localRepository: aFileReference
	"localRepository points to the root of a git repository,
	while directory points to the root of a fileTree repository.
	If subdirectory is nil they point both to the same place."
	localRepository := aFileReference.
	self directory: aFileReference.