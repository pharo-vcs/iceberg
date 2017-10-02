private
categoriesFrom: aCollection
	^ ((aCollection select: #isClassDefinition)
		collect: #category
		as: Set)
		sorted: [ :a :b | a < b ]