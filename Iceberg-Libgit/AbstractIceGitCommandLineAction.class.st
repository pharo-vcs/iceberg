"
I have all the common behavior for executing the git command line tool in a portable way.
I use OSSubProcess on Unixes (Linux / OSX) and WinSubProcess for Windows.
I give an entry point if the subclasses want to show custom progress.
"
Class {
	#name : 'AbstractIceGitCommandLineAction',
	#superclass : 'Object',
	#category : 'Iceberg-Libgit-GitActions',
	#package : 'Iceberg-Libgit',
	#tag : 'GitActions'
}

{ #category : 'testing' }
AbstractIceGitCommandLineAction class >> requiresSubprocessLib [

	^ true
]

{ #category : 'executing' }
AbstractIceGitCommandLineAction >> execute [

	self subclassResponsibility 
]

{ #category : 'executing' }
AbstractIceGitCommandLineAction >> executeSubProcess: command arguments: arguments workingDirectory: workingDirectory onExit: onExitBlock [

	(OSPlatform current in: [ :aPlatform |
		 aPlatform isMacOSX or: [ aPlatform isUnix ] ])
		ifTrue: [ self executeUsingUnixSubProcess: command arguments: arguments workingDirectory: workingDirectory onExit: onExitBlock ]
		ifFalse: [ self executeUsingWindowsSubProcess: command arguments: arguments workingDirectory: workingDirectory onExit: onExitBlock ]
]

{ #category : 'executing' }
AbstractIceGitCommandLineAction >> executeUsingUnixSubProcess: command arguments: arguments workingDirectory: workingDirectory onExit: onExitBlock [

	<ignoreNotImplementedSelectors: #(workingDirectory: redirectStdout redirectStderr runAndWaitPollingEvery:doing:onExitDo: )>
	| outFullStream errFullStream osUnixSubprocessClass |

	osUnixSubprocessClass := self class environment 
		at: #OSSUnixSubprocess 
		ifAbsent: [ self error: 'Missing OSSUnixSubprocess class' ]. 

	outFullStream := WriteStream on: (String new: 10000).
	errFullStream := WriteStream on: (String new: 10000).

	osUnixSubprocessClass new
		command: command;
		arguments: arguments;
		workingDirectory: workingDirectory fullName;
		redirectStdout;
		redirectStderr;
		runAndWaitPollingEvery: 1000 milliSecond asDelay 
		doing: [:process :stdStream :errStream | 
			outFullStream nextPutAll: stdStream upToEnd.
			errFullStream nextPutAll: errStream upToEnd.
			self updateJobStatus: errFullStream contents]

		onExitDo: [:process :stdStream :errStream | 
			
			outFullStream nextPutAll: stdStream upToEnd.
			errFullStream nextPutAll: errStream upToEnd.
			onExitBlock 				
				value: process 
				value: outFullStream contents
				value: errFullStream contents. ].

]

{ #category : 'executing' }
AbstractIceGitCommandLineAction >> executeUsingWindowsSubProcess: command arguments: arguments workingDirectory: workingDirectory onExit: onExitBlock [

	<ignoreNotImplementedSelectors: #(workingDirectory: shellCommand: exitCode creationFlags:)>
	| stderrFile stdoutFile commandString return osWSWinProcessClass rnd |

	osWSWinProcessClass := self class environment 
		at: #OSWSWinProcess 
		ifAbsent: [ self error: 'Missing OSWSWinProcess class' ]. 

	rnd := (Random new nextInteger:16r10000) printStringHex.

	stderrFile := FileLocator temp / ('git-stderr-' , rnd , '.txt').
	stdoutFile := FileLocator temp / ('git-stdout-' , rnd , '.txt').

	commandString := String streamContents: [ :stream |
		           stream
						  nextPutAll: command;
						  nextPutAll: ' '.

					  arguments do: [ :each | stream nextPutAll: each ] separatedBy: [ stream nextPutAll: ' ' ].
						
					  stream
			           nextPutAll: ' 2>> ';
			           nextPutAll: stderrFile fullName;
			           nextPutAll: ' 1>> ';
			           nextPutAll: stdoutFile fullName ].

	return := osWSWinProcessClass new
		          shellCommand: commandString;
					 creationFlags: 16r08000000 "CREATE_NO_WINDOW";
		          workingDirectory: workingDirectory fullName;
		          run.

	"We need to wait until the watcher, updates the exitCode"
	[return isRunning or: [return exitCode isNil]] 
		whileTrue: [ 
			[self updateJobStatus: stderrFile contents] on: FileDoesNotExistException do: [  ].
			MorphicRenderLoop new doOneCycle.
			100 milliSecond wait ].

	onExitBlock
		value: return
		value: stdoutFile contents
		value: stderrFile contents.

	stderrFile ensureDelete.
	stdoutFile ensureDelete
]

{ #category : 'executing' }
AbstractIceGitCommandLineAction >> updateJobStatus: outputString [
]
