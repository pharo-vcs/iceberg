accessing
fileFormat: aFileFormat

	| propertiesFileReference |
	propertiesFileReference := self sourceDirectoryReference / '.properties'.
	self repository properties
		fileFormat: aFileFormat;
		storeOnFileReference: propertiesFileReference.
	self repository index addPath: (self fileSystem relativeTo: repository location).