building
imageChanges
	^ (source loadedPackages collect: [ :package | IceImageChange package: package ]) asArray