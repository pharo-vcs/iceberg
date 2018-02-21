accessing
childAt: aString ifAbsentPut: aBlock
	
	^ childrenDictionary at: aString ifAbsent: [
		self addChild: aBlock value ]