testing
isValidPackageFileReference: aFileReference 
	
	^ (self isValidPackageName: aFileReference basename)
		and: [ aFileReference isDirectory
		and: [ (aFileReference / 'package.st') exists ] ]