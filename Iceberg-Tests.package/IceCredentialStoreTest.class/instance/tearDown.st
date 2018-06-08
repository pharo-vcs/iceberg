running
tearDown
	file ifNotNil: [ file ensureDelete ].
	super tearDown
