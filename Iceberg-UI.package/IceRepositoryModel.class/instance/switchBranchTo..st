actions
switchBranchTo: branch
	branch isRemote
		ifTrue: [ self repository localBranches 
				detect: [:aBranch | aBranch name = branch name ]
				ifFound: [ 
						UIManager default inform: 'Cannot switch to this branch. A local branch with the same name already exists!'.
						self flag: 'We should probably go into detached head state.' ]
				ifNone: [ 
					self shouldCreateLocalBranchFromRemote 
						ifTrue: [ 
							self repository 
								withRepoDo: [ :repo | repo createBranchFromOrigin: branch name ].
							self repository switchToBranchNamed: branch name ]
					ifFalse: [ self shouldBeImplemented ] ] ]
		ifFalse: [ self repository switchToBranchNamed: branch name ]