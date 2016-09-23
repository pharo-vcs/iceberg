tests
testPackageStatus
	| package |
	package := IceRepository registry first packageNamed: 'Iceberg'.
	IceRepositoriesBrowser statusFor: package