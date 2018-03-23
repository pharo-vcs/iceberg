class initialization
handleClassChange: aClassChange

	IceRepository registry do: [ :repository |
		aClassChange packagesAffected do: [ :package |
			repository notifyPackageModified: package name ] ]