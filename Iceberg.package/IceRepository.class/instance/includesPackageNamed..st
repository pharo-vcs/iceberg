API-packages
includesPackageNamed: aString
	"Returns true if the given package name belongs to a package loaded in the image"
	
	^ self workingCopy includesPackageNamed: aString