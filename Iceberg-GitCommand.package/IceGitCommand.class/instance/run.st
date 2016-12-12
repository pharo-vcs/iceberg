running
run
	"Dispatch depending on the platform. Copied from MCFileTreeGitRepository."

	UIManager default
		informUserDuring: [ :bar | 
			bar label: self gitCommand , ' ' , (' ' join: self command).
			Smalltalk platform isWin32
				ifTrue: [ ^ self runProcessWrapperGitCommand ]
				ifFalse: [ ^ self runOSSubprocessGitCommand ]]