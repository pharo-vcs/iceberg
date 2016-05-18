*Iceberg-Core
iceClass
	^ self targetClass ifNotNil: [:class |
		IceSimpleClassReference new targetClass: class ]