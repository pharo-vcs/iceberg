private writing
writeClassDefinition: aClassDefinition on: stream
	| nl |
	nl := self newLine.
	stream 
			<< '"' << nl
			<< (self commentOf: aClassDefinition) << nl
			<< '"' << nl 
			<< (self typeOf: aClassDefinition) 
				<< ' ' << (self typeDefinitionOf: aClassDefinition ) << nl.
	