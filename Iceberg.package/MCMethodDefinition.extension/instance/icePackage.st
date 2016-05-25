*Iceberg-Core
icePackage
	^ self isExtensionMethod 
		ifTrue: [ Ice packageForCategoryNamed: (self category withoutPrefix: '*') ]
		ifFalse: [ self iceClass package ] 