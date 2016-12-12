testing
canHandleType: aType 
	^ self allSubclasses
		anySatisfy: [ :each | each isSuitableForType: aType ]  
	