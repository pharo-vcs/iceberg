testing
isValidPackage: aFileReference 
	
	| aBasename |
	aBasename := aFileReference basename.
		
	^ (aBasename first isLetter
		and: [ aBasename first isUppercase ])
		and: [ aFileReference isDirectory
		and: [ (aFileReference / 'package.st') exists ] ]