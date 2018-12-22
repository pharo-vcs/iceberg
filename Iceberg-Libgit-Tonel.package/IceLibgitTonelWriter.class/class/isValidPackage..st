testing
isValidPackage: aFileReference 
	
	^ aFileReference basename first isLetter
		and: [ aFileReference isDirectory
		and: [ (aFileReference / 'package.st') exists ] ]