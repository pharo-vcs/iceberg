accessing
operation

	^ self model
		detect: [ :i | i definition isFileDefinition and: [ i definition path = item ] ]
		ifNone: [ nil ]