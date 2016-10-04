actions
createNewBranch
	^ [ :presentation | 
		self class createNewBranchIn: presentation selection repository.
		presentation pane browser update. 
	]