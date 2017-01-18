actions
pullFrom: anIceRemote 
	[ self command: {
			'pull'. 
			"If no remote is provided, git will use default pull remote automatically"
			anIceRemote ifNotNil: #remoteName
		} ] 
		on: MCFileTreeGitError
		do: [ 
			self command: 'merge --abort'.
			IceMergeAborted signal.
		]