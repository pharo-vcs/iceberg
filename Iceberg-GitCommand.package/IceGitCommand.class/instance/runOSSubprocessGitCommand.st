running
runOSSubprocessGitCommand
	| classOfOSSUnixSubprocess |
	classOfOSSUnixSubprocess := Smalltalk at: #OSSUnixSubprocess.
	classOfOSSUnixSubprocess new
		command: self gitCommand;
		arguments:
			{'-C'. (MCFileTreeFileUtils current directoryPathString: self directory)}, 
			self command;
		redirectStdout;
		redirectStderr;
		runAndWaitPollingEvery: (Delay forMilliseconds: 5)
			retrievingStreams: true
			onExitDo: [ :cmd :outString :errString | 
			cmd isSuccess
				ifTrue: [ ^ outString ]
				ifFalse: [ MCFileTreeGitError new signal: 'Git error: ' , (errString ifEmpty: outString) ] ]
