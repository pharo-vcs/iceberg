initialization
initializeRemoteURL
	remoteLabel := self newLabel label: 'Remote URL'.
	remoteInputText := self newTextInput
		placeholder: 'e.g., git@github.com:user/MyProject.git';
		autoAccept: true