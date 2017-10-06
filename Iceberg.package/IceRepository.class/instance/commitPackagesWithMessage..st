actions - utility
commitPackagesWithMessage: message
	self modifiedPackages 
		ifEmpty: [ NothingToCommit signal ]
		ifNotEmpty: [ :packages |
			self 
				commitPackages: packages
				withMessage: message ]