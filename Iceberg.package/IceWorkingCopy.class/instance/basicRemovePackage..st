API-packages
basicRemovePackage: aPackage
	
	self packagesDictionary 
		removeKey: aPackage name 
		ifAbsent: []