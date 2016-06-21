action creators
switchBranch
	^ [ :presentation :repo | 
		self class switchBranchOf: presentation selection.
		presentation pane browser update. 
	]