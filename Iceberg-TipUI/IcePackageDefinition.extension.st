Extension { #name : #IcePackageDefinition }

{ #category : #'*Iceberg-TipUI' }
IcePackageDefinition >> browse [
	"Open a browser on the package, if it exists."

	(RPackage organizer packageNamed: name ifAbsent: [ ^ self ]) browse
]

{ #category : #'*Iceberg-TipUI' }
IcePackageDefinition >> canBeBrowsed [

	^ self packageOrganizer hasPackage: name
]

{ #category : #'*Iceberg-TipUI' }
IcePackageDefinition >> canBrowseReferences [
	
	^ false
]

{ #category : #'*Iceberg-TipUI' }
IcePackageDefinition >> icon [
	^ self iconNamed: #package
]
