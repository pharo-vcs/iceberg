actions
commitPackages: modifiedPackages withMessage: message
	
	| commit |
	commit := super commitPackages: modifiedPackages withMessage: message.
	dirtyPackages removeAllFoundIn: (modifiedPackages collect: #name).
	^ commit