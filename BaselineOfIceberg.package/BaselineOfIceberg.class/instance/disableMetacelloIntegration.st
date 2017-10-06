script
disableMetacelloIntegration
	(Smalltalk classNamed: #Iceberg) 
		ifNotNil: [ :c | c enableMetacelloIntegration: false ]