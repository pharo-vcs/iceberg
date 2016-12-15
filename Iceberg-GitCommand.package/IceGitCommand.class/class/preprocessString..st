execute
preprocessString: commandDescription
	^ (commandDescription withoutPrefix: '"') withoutSuffix: '"'