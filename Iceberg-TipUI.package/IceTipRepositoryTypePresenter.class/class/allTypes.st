accessing
allTypes
	^ (self allSubclasses 
		sorted: [ :a :b | a order < b order ])
		collect: #new