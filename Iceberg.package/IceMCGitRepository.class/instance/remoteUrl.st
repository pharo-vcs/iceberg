accessing
remoteUrl
	^ remoteUrl ifNil: [ remoteUrl := 
		(self command: 'config --get remote.origin.url') trim ]