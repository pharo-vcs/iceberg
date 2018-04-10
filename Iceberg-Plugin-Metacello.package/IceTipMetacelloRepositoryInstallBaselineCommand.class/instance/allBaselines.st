private
allBaselines
	^ (self repositoryModel entity workingCopy packages
		select: [ :each | each name beginsWith: 'BaselineOf' ])
		sorted: [ :a :b | a name < b name ]