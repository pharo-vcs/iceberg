API-packages
packages

	^ self packageNames collect: [ :name | IcePackage named: name repository: self repository ]