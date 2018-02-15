accessing
contentsAtCommit: aCommit

	^ (aCommit fileSystem root resolvePath: self path) readStreamDo: [ :str |
		(ZnCharacterReadStream on: str encoding: 'utf8')
			upToEnd ]