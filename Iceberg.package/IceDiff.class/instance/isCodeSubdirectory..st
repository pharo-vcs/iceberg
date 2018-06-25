testing
isCodeSubdirectory: aNode
	
	| nodeLocation repositorySubdirectoryLocation |
	nodeLocation := self repository location resolve: aNode path.
	repositorySubdirectoryLocation := self repository location resolve: (Path from: self repository subdirectory).
	^ nodeLocation = repositorySubdirectoryLocation