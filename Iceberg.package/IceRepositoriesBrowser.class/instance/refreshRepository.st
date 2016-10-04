actions
refreshRepository
	^ [ :presentation | 
		presentation selection repository refresh.
		presentation pane browser update. 
	]