initialization
initializeRemoteURL
	remoteLabel := self newLabel label: 'Remote URL'.
	remoteInputText := self newTextInput 
		ghostText: 'git@github.com:user/MyProject.git';	
		autoAccept: true