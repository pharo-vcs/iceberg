visiting
visitPackage: anIcePackageNode 

	"The modified files in a package depend on the writer format"	
	modifiedFiles add: (currentNode parent path / (repository writerClass directoryNameFor: anIcePackageNode))