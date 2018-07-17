accessing
projectName
	
	^ properties at: #projectName ifAbsent: [ self repository name ]