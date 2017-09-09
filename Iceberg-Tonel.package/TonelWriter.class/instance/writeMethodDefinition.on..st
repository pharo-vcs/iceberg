private writing
writeMethodDefinition: aMethodDefinition on: aStream
	| nl |
	
	nl := self newLine.
	self 
		splitMethodSource: aMethodDefinition 
		into: [ :methodDeclaration :methodBody |
			aStream 
				<< nl 
				<< (self methodDefinitionOf: aMethodDefinition) << nl 
				<< aMethodDefinition fullClassName << ' >> ' << methodDeclaration << ' [' << nl	
				<< methodBody << nl 
				<< ']' << nl ]