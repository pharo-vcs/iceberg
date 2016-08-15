querying
versionsNotLoaded
	| loaded |
	loaded := self loadedVersion.
	^ self versions reject: [ : version | version isAncestorOf: loaded ].
