accessing
diffSource

	| file |	
	file := version fileSystem resolvePath: path.
	^ file binaryReadStreamDo: [ :e | 
		(ZnCharacterReadStream on: e encoding: 'utf8') upToEnd ]