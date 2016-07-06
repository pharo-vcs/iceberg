as yet unclassified
versionFor: anIceSavedPackage 
	^ (self versionDescriptorFor: anIceSavedPackage)
		ifNil: [ self lookupVersionFor: anIceSavedPackage ]
