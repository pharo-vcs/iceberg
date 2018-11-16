API-packages
packageLocationFor: anIceSavedPackage
	| packageLocation directoryName |
	 
	packageLocation := self location.
	self subdirectory ifNotEmpty: [ 
		packageLocation := packageLocation / self subdirectory ].
	directoryName := self writerClass directoryNameFor: anIceSavedPackage.
	packageLocation := packageLocation / directoryName.
	^ packageLocation