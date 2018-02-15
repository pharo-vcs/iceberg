initialization
initialElements

	| builder |
	builder := IceNewDiff new.
	builder diff: self.
	(self myVersion changesTo: self theirVersion)
		do: [ :change | change buildOn: builder ].
	^ builder changes