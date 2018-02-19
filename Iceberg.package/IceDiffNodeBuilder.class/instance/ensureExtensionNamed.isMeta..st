building
ensureExtensionNamed: aString isMeta: isMeta 

	^ parentNode
		childAt: (self ownerNameOf: aString isMeta: isMeta)
		ifAbsentPut: [ IceExtensionNode name: aString meta: isMeta parent: parentNode ]