Extension { #name : #RG2TraitDefinition }

{ #category : #'*Iceberg-Tests' }
RG2TraitDefinition >> asMCDefinition [

	^ MCTraitDefinition
		name: self name
		traitComposition: self traitCompositionString
		category: self category
		instVarNames: ''
		classInstVarNames: ''
		classTraitComposition: self classSide traitCompositionString
		comment: self comment content
		commentStamp: ''
]
