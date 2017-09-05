private
fileNameFor: aClassDefinition
	^ String streamContents: [ :stream | 
		stream 
			<< aClassDefinition className
			<< '.' << (self typeOf: aClassDefinition) asLowercase
			<< '.st'  ]