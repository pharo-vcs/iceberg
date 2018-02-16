building
ensureClassNamed: aString isMeta: aBoolean

	^ changesDictionary
		at: (self ownerNameOf: aString isMeta: aBoolean)
		ifAbsentPut: [ 
			IceClassDiff name: aString meta: aBoolean parent: self ].