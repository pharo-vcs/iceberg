testing
isRevisionOf: aDefinition 
	
	^ (aDefinition isKindOf: IceFileDefinition)
		and: [aDefinition description = self description]