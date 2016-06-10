as yet unclassified
versionFor: anIcePackageReference 
	| packageVersion |
	packageVersion := self versionDescriptorFor: anIcePackageReference.	
	^ (self repository repository versionFromFileNamed: packageVersion)