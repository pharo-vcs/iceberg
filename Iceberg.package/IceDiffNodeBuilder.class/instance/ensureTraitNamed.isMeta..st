building
ensureTraitNamed: className isMeta: isMeta 

	^ parentNode
		childAt: (self ownerNameOf: className isMeta: isMeta)
		ifAbsentPut: [ IceTraitNode name: className meta: isMeta parent: parentNode ]