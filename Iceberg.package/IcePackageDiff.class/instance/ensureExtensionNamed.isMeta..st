building
ensureExtensionNamed: aString isMeta: aBoolean

	^ changesDictionary
		at: (self ownerNameOf: aString isMeta: aBoolean)
		ifAbsentPut: [ 
			IceExtensionDiff name: aString meta: aBoolean parent: self ].