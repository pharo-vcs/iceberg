accessing
cacheAt: aKey ifAbsentPut: anObject
	cache ifNil: [ cache := Dictionary new ].
	^ cache 
		at: aKey 
		ifAbsentPut: anObject