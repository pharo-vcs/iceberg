*Iceberg-UI
updateDiff: aDiffModel
	self classDefinition
		ifNil: [ super updateDiff: aDiffModel ]
		ifNotNil: [ :cd |
			aDiffModel
				contextClass: nil;
				leftText: cd diffToSource;
				rightText: cd diffFromSource
		]
