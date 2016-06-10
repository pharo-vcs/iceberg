as yet unclassified
versionDescriptorFor: anIcePackageReference 
	^ self allVersionDescriptors detect: [ :each | 
		each packageName = anIcePackageReference packageName ].
