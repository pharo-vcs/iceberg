as yet unclassified
versionFor: anIcePackageReference 
	^ (self versionDescriptorFor: anIcePackageReference)
		ifNotNil: [ :packageVersion |
	 		self repository repository versionFromFileNamed: packageVersion 
		]
