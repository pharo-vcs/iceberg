Extension { #name : #MCOrganizationDefinition }

{ #category : #'*Iceberg-Changes' }
MCOrganizationDefinition >> addAnalysisToPackageChangeSet: aPackageChangeSet change: aChange [
	aPackageChangeSet addOrganisationChange: aChange
]

{ #category : #'*Iceberg-Core' }
MCOrganizationDefinition >> iceClass [
	^ nil
]

{ #category : #'*Iceberg-Core' }
MCOrganizationDefinition >> icePackage [
	"TODO: Refactor this, see https://github.com/npasserini/iceberg/issues/42"
	self categories 
		ifNotEmpty: [ ^ Iceberg packageForCategoryNamed: (self categories anyOne) ]
	 	ifEmpty: nil

]
