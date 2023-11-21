Extension { #name : 'IcePackage' }

{ #category : '*Iceberg-TipUI' }
IcePackage >> browse [
	
	(PackageOrganizer default packageNamed: self name) browse
]
