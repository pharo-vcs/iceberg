visiting
visitPackage: anIcePackageNode 
	
	"The modified files in a package depends on the writer format"
	^ { anIcePackageNode parent path / (repository writerClass directoryNameFor: anIcePackageNode package) }