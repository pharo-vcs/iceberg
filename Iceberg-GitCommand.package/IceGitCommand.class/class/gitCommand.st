accessing
gitCommand
	^ Smalltalk os isWindows ifTrue: [ 'git' ] ifFalse:[ '/usr/bin/git' ]
