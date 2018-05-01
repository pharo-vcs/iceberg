API-working copy
createSourceDirectory
	(location / subdirectory) ensureCreateDirectory.
	
	self properties
		at: #format put: self class defaultFileFormat id;
		store	