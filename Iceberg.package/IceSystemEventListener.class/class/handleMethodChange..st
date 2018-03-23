class initialization
handleMethodChange: aMethodChange

	IceRepository registry do: [ :repository |
		aMethodChange packagesAffected do: [ :package |
			repository notifyPackageModified: package name ] ]