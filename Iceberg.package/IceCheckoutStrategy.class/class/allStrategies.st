accessing
allStrategies
	^ (self allSubclasses 
		sorted: [ :a :b | a order < b order ])
		collect: #uniqueInstance