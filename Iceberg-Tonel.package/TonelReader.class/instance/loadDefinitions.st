loading
loadDefinitions
	| definitionOrders newDefinitions newCategories organization |
	
	definitionOrders := Dictionary newFromPairs: { 
		MCOrganizationDefinition. 	0.
		MCMethodDefinition. 			1.
		MCClassDefinition. 			2.
		MCTraitDefinition. 			2.
		MCClassTraitDefinition. 		2 }.
				
	newDefinitions := (self packageDirectory children
		select: [ :each | self canBeLoaded: each ] 
		thenCollect: [ :each | each readStreamDo: [ :s | (TonelParser on: s) start ] ])
		flattened
		sort: [ :a :b | (definitionOrders at: a class) < (definitionOrders at: b class) ].

	newCategories := self categoriesFrom: newDefinitions.
	(newCategories includes: self package name asSymbol)
		ifFalse: [ newCategories := newCategories copyWithFirst: self package name ].
	organization := MCOrganizationDefinition categories: newCategories.
	
	definitions := newDefinitions copyWithFirst: organization