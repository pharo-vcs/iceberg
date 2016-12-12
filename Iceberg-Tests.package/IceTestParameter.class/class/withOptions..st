instance creation
withOptions: aCollection 
	^ self new options: (aCollection collect: #asTestParameterValue); yourself