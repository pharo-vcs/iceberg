accessing
block
	^ [ :path :completed :total :payload | 
		job ensureStarted.
		
		job min: 0.
		job max: total.
		job current: completed.
		job title: ('Checking out... ({1}/{2})' format: { completed. total}).
		
		job changed.
	]