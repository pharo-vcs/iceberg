building
buildClassFromClass: aClassReference 

	^ changesDictionary at: aClassReference targetClassName ifAbsentPut: [ aClassReference ].