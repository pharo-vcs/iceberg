*Iceberg-Libgit
modifiedFiles
	
	"The modified files in a package depends on the writer format"
	^ { self parent path / (self repository writerClass directoryNameFor: self package) }