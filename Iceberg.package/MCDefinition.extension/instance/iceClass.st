*Iceberg-Core
iceClass
	^ self actualClass ifNotNil: [:class |
		IceSimpleClassReference new targetClass: class ]