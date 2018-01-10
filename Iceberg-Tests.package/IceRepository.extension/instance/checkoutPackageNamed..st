*Iceberg-Tests
checkoutPackageNamed: packageName

	self workingCopy
		checkoutPackageNamed: packageName
		fromCommit: self head commit