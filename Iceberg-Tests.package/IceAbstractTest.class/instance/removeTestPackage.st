auxiliar
removeTestPackage
	{ packageName. 'BaselineOfPharoGitTest' } do: [ :name |
		MCWorkingCopy registry
			at: (MCPackage named: name)
			ifPresent: [ :wc | wc unload ]]
