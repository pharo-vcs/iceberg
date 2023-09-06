Extension { #name : #RG2PackageDefinition }

{ #category : #'*Iceberg-Tests' }
RG2PackageDefinition >> asMCSnapshot [

	| definitions |
	definitions := ((((self definedBehaviors reject: #isMeta) sorted: [ :a :b | a name < b name ]) collect: #asMCDefinition)
	                , (self extensionMethods collect: #asMCDefinition)) asOrderedCollection.
	definitions addAll: (self definedBehaviors
			 select: [ :each | each isTrait and: [ each classSide hasTraitComposition ] ]
			 thenCollect: [ :aTrait | aTrait classSide asMCDefinition ]).

	definitions addAll: (self definedBehaviors , (self definedBehaviors collect: #classSide) flatCollect: [ :behavior |
			 behavior localMethods
				 select: [ :each | each parent instanceSide package = each package ]
				 thenCollect: [ :method | method asMCDefinition ] ]).
	definitions add: (MCOrganizationDefinition packageName: name).

	^ MCSnapshot fromDefinitions: definitions
]
