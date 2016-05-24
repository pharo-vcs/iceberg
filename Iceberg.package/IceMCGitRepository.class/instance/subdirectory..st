accessing
subdirectory: aString
	super subdirectory: aString.
	self directory: self localRepository / subdirectory 