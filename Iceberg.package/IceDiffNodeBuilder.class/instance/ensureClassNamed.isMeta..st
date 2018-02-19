building
ensureClassNamed: className isMeta: isMeta 
	
	^ parentNode
		childAt: (self ownerNameOf: className isMeta: isMeta)
		ifAbsentPut: [ IceClassNode name: className meta: isMeta parent: parentNode ]