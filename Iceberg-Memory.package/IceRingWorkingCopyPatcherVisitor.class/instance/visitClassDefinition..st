visiting
visitClassDefinition: anIceClassDefinition 
	
	| package |
	package := workingCopy packages detect: [ :icePackage | 
		anIceClassDefinition asMCDefinition category beginsWith: icePackage name ].
	workingCopy
		createClass: anIceClassDefinition name
		inPackage: package name
		superclass: anIceClassDefinition asMCDefinition superclassName.