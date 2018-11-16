running
tearDown
	self parameters
		do: [ :parameter | 
			[ parameter deactivate ]
				on: Error
				do: [ :error | error logCr ] ].
	IceLibgitRepository shareRepositoriesBetweenImages: oldShareRepositoriesBetweenImages.
	super tearDown