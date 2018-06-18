running
tearDown
	file ifNotNil: [ file ensureDelete ].
	dir ifNotNil: [ dir ensureDeleteAll ].
	super tearDown
