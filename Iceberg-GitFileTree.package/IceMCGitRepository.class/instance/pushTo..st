actions
pushTo: aRemote
	| command |
	
	"If no upstream is set, I need to set it"
	command := self upstream
		ifNotNil: [ { 'push'. aRemote remoteName. self branch name } ] 
		ifNil: [ { 'push'. '--set-upstream'. aRemote remoteName. self branch name } ].
	
	[ self command: command ] 
	on: MCFileTreeGitError 
	do: [ YouShouldPullBeforePush signal ]
