repository handling
forget
	(self class registry remove: self ifAbsent: [ "Ignore" ])
		ifNotNil: [ Iceberg announcer announce: IceRepositoryForgotten new ]