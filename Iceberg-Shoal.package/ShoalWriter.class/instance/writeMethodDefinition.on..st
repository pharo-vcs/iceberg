private writing
writeMethodDefinition: aMethodDefinition on: stream
	| nl |
	
	nl := self newLine.
	self 
		splitMethodSouce: aMethodDefinition 
		into: [ :methodDeclaration :methodBody |
			stream 
				<< nl 
				<< (self methodDefinitionOf: aMethodDefinition) << nl 
				<< aMethodDefinition fullClassName << '>>' << methodDeclaration << ' [' << nl	
				<< methodBody << nl 
				<< ']' << nl ]