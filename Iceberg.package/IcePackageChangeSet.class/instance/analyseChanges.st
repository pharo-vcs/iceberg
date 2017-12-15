initialization
analyseChanges
	| newChanges |

	newChanges := self basicChanges.
	newChanges ifEmpty: [ 
		(self package isLoaded 
			and: [ self package isModified
			and: [ self parent theirVersion isKindOf: IceWorkingCopy ]])
			ifTrue: [ self package workingCopy modified: false ]].
	
	changes := OrderedCollection new.
	newChanges do: [ :change | 
		change definition 
			addAnalysisToPackageChangeSet: self
			change: change ]
