API-configuration
getConfigurationGlobal: aBoolean

	| config |
	config := handle config.
	^ aBoolean
		ifTrue: [ config openGlobal ]
		ifFalse: [ config ]