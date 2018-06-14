API-working copy
createSourceDirectory
	(location / self subdirectory) ensureCreateDirectory.
	
	self properties
		fileFormat: self class defaultFileFormat;
		store	