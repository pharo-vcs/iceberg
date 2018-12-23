running
runProcessWrapperGitCommand
	"Enclose all parameters with double quotes to protect."

	| r aCommandString |
	aCommandString := String
		streamContents: [ :stream | 
			self command
				do: [ :e | 
					stream
						nextPut: $";
						nextPutAll: e;
						nextPutAll: '" ' ] ].
	(Smalltalk at: #ProcessWrapper ifAbsent: [ self error: 'Please load ProcessWrapper' ])
		ifNotNil: [ :pW | 
			| cmd |
			cmd := pW new.
			cmd useStdout.
			cmd useStderr.
			self assert: (cmd startWithCommand:
					self gitCommand , ' -C "'
						,
							(MCFileTreeFileUtils current directoryPathString: self directory)
						, '" ' , aCommandString).
			cmd waitForExit.
			self assert: cmd isRunning not.
			r := cmd upToEnd.
			cmd exitCode > 0
				ifTrue:
					[ 
					| errorString |
					errorString := cmd errorUpToEnd.
					errorString notEmpty
						ifTrue:
							[ Error signal: 'Git error: ' , errorString ].
					r := '' ] ].
	^ r