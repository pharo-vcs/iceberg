private writing
writeInstanceSideMethodDefinitions: aClassDefinition on: stream
	((snapshot definitions 
		select: [ :each | 
			each isMethodDefinition 
			and: [ each className = aClassDefinition className
			and: [ each classIsMeta not ] ] ])
		sorted: [ :a :b | a selector < b selector ])
		do: [ :each | 
			self writeMethodDefinition: each on: stream ]

	
	