actions
pull
	[ self command: 'pull' ] 
		on: MCFileTreeGitError
		do: [ 
			self command: 'merge --abort'.
			IceMergeAborted signal.
		]