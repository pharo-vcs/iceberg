as yet unclassified
snapshotFor: anIcePackageReference 
	| packageVersion |
	packageVersion := 
		(self repository allVersionDescriptors select: [ :each | each commitID hex = self commitId ])
			detect: [ :each | each packageName = anIcePackageReference packageName ].
	
	^ (self repository repository versionFromFileNamed: packageVersion) snapshot