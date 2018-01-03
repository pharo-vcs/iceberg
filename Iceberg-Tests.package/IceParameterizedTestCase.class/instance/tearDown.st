running
tearDown
	self parameters do: [ :parameter |
		[ parameter deactivate ] on: Error do: [ :error | error logCr ] ].
	IceRepository shareRepositoriesBetweenImages: oldShareRepositoriesBetweenImages
	
	
