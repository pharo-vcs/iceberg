repository handling
forget
	(self class unregisterRepository: self ifAbsent: [ "Ignore" ])
		ifNotNil: [ Iceberg announcer announce: (IceRepositoryForgotten repository: self) ]