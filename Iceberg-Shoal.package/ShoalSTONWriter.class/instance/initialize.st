initialization
initialize
	super initialize.
	self prettyPrint: true.
	aliases := { OrderedDictionary -> nil } asDictionary