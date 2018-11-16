visiting
visitExtensionDefinition: anExtensionDefinition 
	
	workingCopy environment ask behaviorNamed: anExtensionDefinition name ifAbsent: [ self error: 'Not found' ].