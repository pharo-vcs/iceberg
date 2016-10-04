actions
switchBranch
	^ [ :presentation | 
		self class switchBranchOf: presentation selection repository.
		presentation pane browser update. 
	]