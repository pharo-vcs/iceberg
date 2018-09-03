event handling
handleClassChange: aClassChange

	"We should take care not only about the class package but also the package of the methods extending that class."
	self handlePackagesChange: aClassChange packagesAffected.
	self handlePackagesChange: (aClassChange classRenamed methods collect: #package) asSet.
	self handlePackagesChange: (aClassChange classRenamed classSide methods collect: #package) asSet.