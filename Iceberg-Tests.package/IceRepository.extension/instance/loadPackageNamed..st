*Iceberg-Tests
loadPackageNamed: packageName

	self workingCopy
		loadPackageNamed: packageName
		fromCommit: self head commit