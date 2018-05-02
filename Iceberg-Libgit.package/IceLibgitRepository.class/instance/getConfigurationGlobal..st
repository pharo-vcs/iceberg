API-configuration
getConfigurationGlobal: aBoolean

	self handleLibgitError: [ | config |
		config := self repositoryHandle config.
		^ aBoolean
			ifTrue: [ config openGlobal ]
			ifFalse: [ config ] ]