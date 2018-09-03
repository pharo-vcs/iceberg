event handling
handleClassChange: aClassChange

	"We should take care not only about the class package but also the package of the methods extending that class."
	self handlePackagesChange: aClassChange packagesAffected.
	self handlePackagesChange: (aClassChange classAffected methods collect: #package) asSet.
	self handlePackagesChange: (aClassChange classAffected classSide methods collect: #package) asSet.