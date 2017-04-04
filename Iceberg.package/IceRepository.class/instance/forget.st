repository handling
forget
	(self class unregisterRepository: self ifAbsent: [ nil ])
		ifNotNil: [ Iceberg announcer weak announce: (IceRepositoryForgotten repository: self) ]