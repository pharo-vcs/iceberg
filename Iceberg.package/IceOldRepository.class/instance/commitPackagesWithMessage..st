actions - utility
commitPackagesWithMessage: message
	self modifiedPackages 
		ifEmpty: [ IceNothingToCommit signal ]
		ifNotEmpty: [ :packages |
			self 
				commitPackages: packages
				withMessage: message ]