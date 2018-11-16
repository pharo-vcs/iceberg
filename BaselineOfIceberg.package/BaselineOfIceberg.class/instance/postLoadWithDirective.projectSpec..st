script
postLoadWithDirective: aDirective projectSpec: aSpec
	| repository |
	self resetKMRepository.

	"Getting the repository from metacello..."
	repository := aSpec repositories list first spec createRepository.

	"We only apply the bootstrap only of the repository is a github repository.
	This is because in Iceberg's CI, the repository is cloned before and the code is loaded using filetree, so we have no commit information here..."
	(repository isKindOf: MCGitHubRepository) ifFalse: [ ^ self ].

	(Smalltalk at: #Iceberg)
		bootstrapWithCommitId: repository commitId
		packageList: aSpec packageNames