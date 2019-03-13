private
ensureMCClassOrganisationHasCorrectStructure: mcVersion
	| organisation |

	organisation := mcVersion snapshot definitions 
		detect: [ :each | each isOrganizationDefinition ].
		
	(organisation categories size = 1) ifFalse: [ | baseCategory |
		baseCategory := self 
			obtainCommonCategory: organisation categories first 
			from: organisation categories.
		baseCategory ifEmpty: [ 
			self error: 'I didn''t find a base category, something is wrong with the package definition' ].
		baseCategory = organisation categories first ifFalse: [ 
			organisation categories: (organisation categories copyWithFirst: baseCategory) ] ].
	
	^ mcVersion