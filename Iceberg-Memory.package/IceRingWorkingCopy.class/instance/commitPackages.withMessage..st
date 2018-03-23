actions
commitPackages: modifiedPackages withMessage: message
	
	| commit |
	commit := super commitPackages: modifiedPackages withMessage: message.
	modifiedPackages do: [:each |
		self markAsDirtyPackageNamed: each name ].
	^ commit