testing
isCodeSubdirectory: aNode
	
	| nodeLocation repositorySubdirectoryLocation |
	nodeLocation := self repository location resolve: aNode path.
	repositorySubdirectoryLocation := self repository subdirectoryReference.
	^ nodeLocation pathString = repositorySubdirectoryLocation pathString