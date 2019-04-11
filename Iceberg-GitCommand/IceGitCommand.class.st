"
I allow to execute git command. I am not intended to be instantiated, just do:  `IceGitCommand in: aDirectory execute: aCommandDescription`

A command description can be
1. A string with a git command line, for example:
```
IceGitCommand in: aDirectory execute: 'checkout master'
```
Will have the same efect as going with the command line to the same directory and execute `git checkout master`.

2. A collection of arguments. For example the same previous efect can be achieved using:
```
IceGitCommand in: aDirectory execute: {'checkout'. 'master'}
```

Moreover, the command description can contain:
- strings (that are transferred to git without modifications.
- other collections (the command description will be flattened).
- nil (that will be ignored)

The latter is useful for simplifying the specification of optional parameters, for example:

```
	self in: self location parent executeCommand:
		{'clone'.
		branch notNil ifTrue: {'-b'. branch}.
		readonly ifTrue: {'--depth'. '1'}.
		remoteUrl.
		location basename}
```

"
Class {
	#name : #IceGitCommand,
	#superclass : #Object,
	#instVars : [
		'directory',
		'command'
	],
	#category : 'Iceberg-GitCommand'
}

{ #category : #accessing }
IceGitCommand class >> gitCommand [
	^ Smalltalk os isWindows ifTrue: [ 'git' ] ifFalse:[ '/usr/bin/git' ]

]

{ #category : #execute }
IceGitCommand class >> in: directory execute: commandDescription [
	"See class comments for the specification of possible command descriptions"
	^ self new 
		directory: directory;
		command: (self preprocess: commandDescription);
		run

]

{ #category : #execute }
IceGitCommand class >> preprocess: commandDescription [
	commandDescription ifNil: [ ^ {} ]. 
	commandDescription isString ifTrue: [ 
		(commandDescription beginsWith: '"')
			ifTrue: [ ^ { self preprocessString: commandDescription } ]
			ifFalse: [ ^ ' ' split: commandDescription ]].
	commandDescription isCollection ifTrue: [ 
		^ commandDescription flatCollect: [ :elem | self preprocess: elem ]].
	
	self error: ('Unknown argument type in git command: {1}' format: commandDescription)
]

{ #category : #execute }
IceGitCommand class >> preprocessString: commandDescription [
	^ (commandDescription withoutPrefix: '"') withoutSuffix: '"'
]

{ #category : #accessing }
IceGitCommand >> command [
	^ command
]

{ #category : #accessing }
IceGitCommand >> command: anObject [
	command := anObject
]

{ #category : #accessing }
IceGitCommand >> directory [
	^ directory
]

{ #category : #accessing }
IceGitCommand >> directory: anObject [
	directory := anObject
]

{ #category : #accessing }
IceGitCommand >> gitCommand [
	^ self class gitCommand
]

{ #category : #running }
IceGitCommand >> run [
	"Dispatch depending on the platform. Copied from MCFileTreeGitRepository."

	UIManager default
		informUserDuring: [ :bar | 
			bar label: self gitCommand , ' ' , (' ' join: self command).
			Smalltalk platform isWin32
				ifTrue: [ ^ self runProcessWrapperGitCommand ]
				ifFalse: [ ^ self runOSSubprocessGitCommand ]]
]

{ #category : #running }
IceGitCommand >> runOSSubprocessGitCommand [
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
				ifFalse: [ Error new signal: 'Git error: ' , (errString ifEmpty: outString) ] ]

]

{ #category : #running }
IceGitCommand >> runProcessWrapperGitCommand [
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
]
