Extension { #name : #RG2MetaclassTraitDefinition }

{ #category : #'*Iceberg-Tests' }
RG2MetaclassTraitDefinition >> asMCDefinition [

	^ MCClassTraitDefinition
		baseTraitName: baseTrait name
		classTraitComposition: self traitCompositionString
		category: self category 
]
