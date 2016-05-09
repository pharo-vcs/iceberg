initialization
initialElements
	| changeSets localChanges extensionChanges |
	
	changeSets := (((self patch operations
		"If class is nil it represents a package operation, 
		which is not persisted in current file format."
		select: [ :op | op targetClass notNil ]) 
		groupedBy: #targetClass) 
		associations collect: [:assoc | 
			IceClassChangeSet class: assoc key operations: assoc value])
		groupedBy: [ :changeSet | self isExtension: changeSet ].
		
	
	localChanges := changeSets at: false ifAbsent: {}.
	extensionChanges := changeSets at: true 
		ifPresent: [:extensions | 
			{ IceSimpleChangeSet 
				description: '* extension methods' 
				elements: extensions }]
		ifAbsent: {}.
		
	^ localChanges, extensionChanges 

"[ :op | | targetClass | 
			targetClass := op targetClass.
			targetClass package = self package correspondingRPackage  
				ifTrue: [targetClass]
				ifFalse: ['* extension methods']]"