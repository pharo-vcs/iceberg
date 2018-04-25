visiting
visitMethodNode: anIceMethodDefinition 

	workingCopy
		createMethod: anIceMethodDefinition sourceCode
		inClass: anIceMethodDefinition className