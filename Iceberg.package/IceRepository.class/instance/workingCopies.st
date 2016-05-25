working copies
workingCopies
	^ self loadedPackages collect: #workingCopy
"	^ Array streamContents: [ :result |
		self lookupPackages collect: [ :directory |
			Ice packageNamed: (directory asFileReference basenameWithoutExtension)
				 ifPresent: [ :package | result nextPut: package mcPackage ]
		]]
"