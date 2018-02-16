building
build

	(self myVersion changesTo: self theirVersion)
		do: [ :change | change buildOn: self ].