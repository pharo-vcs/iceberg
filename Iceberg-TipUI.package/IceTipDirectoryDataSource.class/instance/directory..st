accessing
directory: aDirectory

	rootItem := (self class rootItemFor: (self childrenToShowFrom: aDirectory))
		dataSource: self;
		yourself.
	self rootItem: rootItem