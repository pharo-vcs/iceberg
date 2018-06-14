initialization
initialize

	selectedDirectoryPath := RelativePath new.
	formats := TIceRepositoryWriter users sorted: [ :a :b | a description < b description ].
	defaultFormat := IceLibgitRepository defaultFileFormat.
	
	super initialize.