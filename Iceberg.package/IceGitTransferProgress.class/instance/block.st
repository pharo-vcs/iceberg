accessing
block
	^ [ :stats :payload | 
		| gitStats |
		gitStats := LGitTransferProgress fromHandle: stats.
		job ensureStarted.
		
		job min: 0.
		job max: gitStats prim_total_objects.
		job current: gitStats prim_received_objects.
		job title: ('Fetching Git objects... ({1}/{2})' format: { gitStats prim_received_objects. gitStats prim_total_objects}).
		
		job changed.
		
		0
	]