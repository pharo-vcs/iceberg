actions
changeLocation
	(UIManager default chooseDirectoryFrom: self location) 
		ifNotNil: [ :fileReference | self location: fileReference ]