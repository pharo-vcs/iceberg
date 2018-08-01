accessing
directory: aDirectory

	rootItem := (self class rootItemFor: { aDirectory })
		dataSource: self;
		yourself.
	self rootItem: rootItem