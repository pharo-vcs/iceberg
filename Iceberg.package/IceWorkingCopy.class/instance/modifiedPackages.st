API-changes
modifiedPackages
	
	"For each of the loaded versions, we obtain the MC working copy.
	We use MC to compute if a package is changed or not"
	^ self loadedPackages select: [ :e | 
		self mcPackageNeedsSaving: e ]