accessing
allTypes
	^ ((self allSubclasses 
		reject: #isAbstract)
		sorted: [ :a :b | a order < b order ])
		collect: #new