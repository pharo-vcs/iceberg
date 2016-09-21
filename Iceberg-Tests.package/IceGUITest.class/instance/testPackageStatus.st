tests
testPackageStatus
	repository loadedPackages do: [ :package |
		IceRepositoriesBrowser statusFor: package
	]
