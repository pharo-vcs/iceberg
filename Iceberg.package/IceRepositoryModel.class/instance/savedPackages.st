accessing
savedPackages
	^ self repository savedPackages collect: [ :package | IcePackageModel modelFor: package ]