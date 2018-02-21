accessing
contents
	
	^ fileReference readStreamDo: [ :str | 
		(ZnCharacterReadStream on: str encoding: 'utf8') upToEnd ]