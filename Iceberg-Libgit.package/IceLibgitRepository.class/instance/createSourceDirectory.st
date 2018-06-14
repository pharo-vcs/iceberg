API-working copy
createSourceDirectory
	(location / self subdirectory) ensureCreateDirectory.
	
	self properties
		at: #format put: self class defaultFileFormat id;
		store	