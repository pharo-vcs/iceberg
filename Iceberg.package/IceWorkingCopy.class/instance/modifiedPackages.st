packages
modifiedPackages
	
	"For each of the loaded versions, we obtain the MC working copy.
	We use MC to compute if a package is changed or not"
	| headPackageNames |
	headPackageNames := repository head packageNames.
	^ self packages select: [ :iceSavedPackage |
		(headPackageNames includes: iceSavedPackage name) not
			or: [ self mcPackageNeedsSaving: iceSavedPackage ] ].