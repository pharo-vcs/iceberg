accessing
contents
	
	^ fileReference binaryReadStreamDo: [ :str |
		(ZnCharacterReadStream on: str encoding: 'utf8') upToEnd ]