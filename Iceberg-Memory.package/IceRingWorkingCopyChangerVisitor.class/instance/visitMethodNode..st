visiting
visitMethodNode: anIceMethodDefinition 

	| isExtensionMethod |
	isExtensionMethod := anIceMethodDefinition protocol first = $*.
	isExtensionMethod
		ifTrue: [ 
			workingCopy
				createMethod: anIceMethodDefinition sourceCode
				extendingClass: anIceMethodDefinition className
				inPackage: anIceMethodDefinition protocol allButFirst ]
		ifFalse: [
			workingCopy
				createMethod: anIceMethodDefinition sourceCode
				inClass: anIceMethodDefinition className ]