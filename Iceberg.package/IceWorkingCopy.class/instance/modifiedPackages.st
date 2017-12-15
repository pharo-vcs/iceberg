packages
modifiedPackages
	
	"For each of the loaded versions, we obtain the MC working copy.
	We use MC to compute if a package is changed or not"
	^ self packages select: [ :mcPackage |
		(repository head packageNames includes: mcPackage name) not
			or: [ mcPackage workingCopy needsSaving ] ].