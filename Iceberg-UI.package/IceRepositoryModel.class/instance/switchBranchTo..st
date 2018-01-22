actions
switchBranchTo: branch
	branch isRemote
		ifTrue: [ self repository localBranches 
				detect: [:aBranch | aBranch shortname = branch shortname ]
				ifFound: [ 
						UIManager default inform: 'Cannot switch to this branch. A local branch with the same name already exists!'.
						self flag: 'We should probably go into detached head state.' ]
				ifNone: [ 
					self shouldCreateLocalBranchFromRemote 
						ifTrue: [ 
							self repository 
								withRepoDo: [ :repo | repo createBranchFromOrigin: branch shortname ].
							self repository switchToBranchNamed: branch shortname ]
					ifFalse: [ self shouldBeImplemented ] ] ]
		ifFalse: [ self repository switchToBranchNamed: branch shortname ]