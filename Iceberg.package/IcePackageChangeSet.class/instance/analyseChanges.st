initialization
analyseChanges
	| newChanges |
	newChanges := self basicChanges.
	
	newChanges ifEmpty: [ 
		(self package isLoaded 
			and: [ self package workingCopy modified
			and: [(self parent myVersion isKindOf: IceWorkingCopy) 
			and: [ self parent theirVersion isKindOf: IceLoadedCode ]]])
			ifTrue: [ self package workingCopy modified: false ]].
	
	changes := OrderedCollection new.
	newChanges do: [ :change | change definition isOrganizationDefinition
		ifTrue: [ 
			change isAddition 
				ifTrue: [ self newOrganization: change definition categories ]
				ifFalse: [ 
					change isRemoval 
						ifTrue: [ self oldOrganization: change definition categories ]
						ifFalse: [ self error: 'Can not handle definition' ]]]
		ifFalse: [ changes add: change ]].
