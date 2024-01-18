Extension { #name : 'MCDefinition' }

{ #category : '*Iceberg-Changes' }
MCDefinition >> addAnalysisToPackageChangeSet: aPackageChangeSet change: aChange [
	aPackageChangeSet addChange: aChange
]

{ #category : '*Iceberg-changes' }
MCDefinition >> isFileDefinition [
	
	^ false
]
