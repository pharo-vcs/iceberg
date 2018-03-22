accessing
allAvailableFor: aRepository
	^ ((self allSubclasses 
		select: [ :each | each isAvailableFor: aRepository ])
		sorted: [ :a :b | a order < b order ])
		collect: #new