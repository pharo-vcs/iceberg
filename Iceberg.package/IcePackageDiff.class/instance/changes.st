initialization
changes

	hasCalculatedChanges ifFalse: [ self calculatePackageChanges ].
	^ super changes