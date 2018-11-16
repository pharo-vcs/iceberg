accessing
block
	^ [ :current :total :bytes :payload | 
		job ensureStarted.
		
		job min: 0.
		job max: total.
		job current: current.
		job title: ((self title, ' ({1}/{2})') format: { current. total}).
		
		job changed.
		
		0
	]