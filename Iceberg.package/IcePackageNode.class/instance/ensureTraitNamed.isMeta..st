building
ensureTraitNamed: aString isMeta: aBoolean

	^ changesDictionary
		at: (self ownerNameOf: aString isMeta: aBoolean)
		ifAbsentPut: [ 
			IceTraitNode name: aString meta: aBoolean parent: self ].