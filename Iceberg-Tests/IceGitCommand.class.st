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
	#name : 'IceGitCommand',
	#superclass : 'Object',
	#instVars : [
		'directory',
		'command'
	],
	#category : 'Iceberg-Tests',
	#package : 'Iceberg-Tests'
}

{ #category : 'accessing' }
IceGitCommand class >> gitCommand [
	^ Smalltalk os isWindows ifTrue: [ 'git' ] ifFalse:[ '/usr/bin/git' ]

]

{ #category : 'execute' }
IceGitCommand class >> in: directory execute: commandDescription [
	"See class comments for the specification of possible command descriptions"
	^ self new 
		directory: directory;
		command: (self preprocess: commandDescription);
		run

]

{ #category : 'execute' }
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

{ #category : 'execute' }
IceGitCommand class >> preprocessString: commandDescription [
	^ (commandDescription withoutPrefix: '"') withoutSuffix: '"'
]

{ #category : 'accessing' }
IceGitCommand >> command [
	^ command
]

{ #category : 'accessing' }
IceGitCommand >> command: anObject [
	command := anObject
]

{ #category : 'accessing' }
IceGitCommand >> directory [
	^ directory
]

{ #category : 'accessing' }
IceGitCommand >> directory: anObject [
	directory := anObject
]

{ #category : 'accessing' }
IceGitCommand >> gitCommand [
	^ self class gitCommand
]

{ #category : 'running' }
IceGitCommand >> run [

	UIManager default informUserDuring: [ :bar | 
		bar label: self gitCommand , ' ' , (' ' join: self command).
		self runLibCGitCommand ]

]

{ #category : 'running' }
IceGitCommand >> runLibCGitCommand [

	| exitCode aCommandString |
	"Enclose all parameters with double quotes to protect."
	aCommandString := String streamContents: [ :stream | 
		                  stream
			                  nextPutAll: self gitCommand;
			                  nextPutAll: ' -C "';
			                  nextPutAll:
				                  (MCFileTreeFileUtils current 
					                   directoryPathString: self directory);
			                  nextPutAll: '" '.
		                  self command do: [ :e | 
			                  stream
				                  nextPut: $";
				                  nextPutAll: e;
				                  nextPutAll: '" ' ] ].

	exitCode := LibC runCommand: aCommandString.

	exitCode > 0 ifTrue: [ 
		Error signal: 'Shell git error (but message was lost)' ]
]
