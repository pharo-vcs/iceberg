private definitions
commentOf: aClassDefinition
	^ (aClassDefinition comment 
		copyReplaceAll: '"' 
		with: '""')
		withLineEndings: self newLine