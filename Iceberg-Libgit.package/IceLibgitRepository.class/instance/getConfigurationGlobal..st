API-configuration
getConfigurationGlobal: aBoolean

	| config |
	config := self repositoryHandle config.
	^ aBoolean
		ifTrue: [ config openGlobal ]
		ifFalse: [ config ]