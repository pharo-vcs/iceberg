writing
writeClass: aClassDefinition
	[ 
		(self packageDir / (self fileNameFor: aClassDefinition)) 
		ensureDelete;
		writeStreamDo: [ :stream | 
			self writeClassDefinition: aClassDefinition on: stream.
			self writeClassSideMethodDefinitions: aClassDefinition on: stream.
			self writeInstanceSideMethodDefinitions: aClassDefinition on: stream.
		 ] ]
	on: TonelShouldIgnore
	do: [ :e | self logCr: 'ignoring: ', aClassDefinition asString ] 