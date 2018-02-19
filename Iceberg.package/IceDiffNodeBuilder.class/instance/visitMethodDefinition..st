visiting
visitMethodDefinition: aMethodDefinition
	
	| ownerNode methodNode |
	ownerNode := self
		ensureMethodOwnerNamed: aMethodDefinition className
		isMeta: aMethodDefinition classIsMeta.
	
	methodNode := IceMethodNode name: aMethodDefinition selector parent: self.
	ownerNode childAt: aMethodDefinition selector put: methodNode.
	diff addOperation: operation forNode: methodNode.
	^ methodNode