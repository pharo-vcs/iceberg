API-registry
forget
	self class unregisterRepository: self ifAbsent: [ ^ nil ].
	Iceberg announcer announce: (IceRepositoryForgotten repository: self)