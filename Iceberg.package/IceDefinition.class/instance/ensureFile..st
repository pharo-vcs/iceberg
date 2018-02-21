building
ensureFile: aFileReference 
	
	^ (self ensureFileNamed: aFileReference basename)
		fileReference: aFileReference;
		yourself