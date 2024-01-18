Extension { #name : 'MCOrganizationDefinition' }

{ #category : '*Iceberg-Changes' }
MCOrganizationDefinition >> addAnalysisToPackageChangeSet: aPackageChangeSet change: aChange [
	aPackageChangeSet addOrganisationChange: aChange
]

{ #category : '*Iceberg-Core' }
MCOrganizationDefinition >> iceClass [
	^ nil
]
