as yet unclassified
isPackageExported: anIceSavedPackage

	| packageLocation |
	packageLocation := self packageLocationFor: anIceSavedPackage.
	^ packageLocation exists and: [ packageLocation hasChildren ]