building
build

	self buildSourceDirectory.
	(source changesTo: target) do: [ :change | change accept: self ].