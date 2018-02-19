building
ensureExtensionNamed: aString isMeta: aBoolean

	^ changesDictionary
		at: (self ownerNameOf: aString isMeta: aBoolean)
		ifAbsentPut: [ 
			IceExtensionNode name: aString meta: aBoolean parent: self ].