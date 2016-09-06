actions
createNewBranch
	^ [ :presentation | 
		self class createNewBranchIn: presentation selection.
		presentation pane browser update. 
	]