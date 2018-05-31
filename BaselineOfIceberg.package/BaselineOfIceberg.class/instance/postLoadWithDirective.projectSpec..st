script
postLoadWithDirective: aDirective projectSpec: aSpec

	| repository |
	self resetKMRepository.

	"Getting the repository from metacello..."
	repository := aSpec repositories list first spec createRepository.
	(Smalltalk at: #Iceberg)
		bootstrapWithCommitId: repository commitId
		packageList: aSpec packageNames.