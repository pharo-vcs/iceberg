actions
refreshRepository
	^ [ :presentation | 
		presentation selection refresh.
		presentation pane browser update. 
	]