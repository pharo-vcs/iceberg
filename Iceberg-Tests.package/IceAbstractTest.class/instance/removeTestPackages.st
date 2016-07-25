auxiliar
removeTestPackages
	{ packageName. 'BaselineOfPharoGitTest', 'IcebergTestPackage2' } do: [ :name |
		MCWorkingCopy registry
			at: (MCPackage named: name)
			ifPresent: [ :wc | wc unload ]]
