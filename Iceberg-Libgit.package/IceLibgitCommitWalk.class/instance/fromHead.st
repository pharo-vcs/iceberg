walk definition
fromHead
	[ self revwalk pushHead ]
		on: LGit_GIT_ERROR
		do: [ :error | 
			error object = LGitErrorTypeEnum giterr_reference 
				ifTrue: [ 
					"Head reference does not exist, ignore error, 
					will produce an empty commit walk." ]
				ifFalse: [ 
					"Any other error is passed to the enclosing handler"
					error pass ]
		]
