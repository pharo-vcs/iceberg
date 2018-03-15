accessing
allTypesOn: aModel
	^ (self allSubclasses
		sorted: [ :a :b | a order < b order ])
		collect: [ :each | each on: aModel ]