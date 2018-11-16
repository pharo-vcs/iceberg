visiting
visitMethodDefinition: aMCMethodDefinition 
	
	| ownerName isMeta isTrait ownerNode |
	
	ownerName := aMCMethodDefinition className.
	isMeta := aMCMethodDefinition classIsMeta.
	isTrait := self isTrait: aMCMethodDefinition className.
	
	ownerNode := self
		ensureMethodOwnerNamed: ownerName
		isMeta: isMeta
		isTrait: isTrait
		isExtension: (self isExtension: aMCMethodDefinition className).

	^ ownerNode addChild: (IceMethodDefinition
		className: aMCMethodDefinition className
		classIsMeta: aMCMethodDefinition classIsMeta
		protocol: aMCMethodDefinition protocol
		name: aMCMethodDefinition selector
		sourceCode: aMCMethodDefinition source)