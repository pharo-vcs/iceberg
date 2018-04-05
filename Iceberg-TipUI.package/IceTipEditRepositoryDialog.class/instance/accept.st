actions
accept
	^ self withAssertHandlingDo: [ 
		self validate.
		self model
			updateLocation: self location
			subdirectory: self subdirectory  ]