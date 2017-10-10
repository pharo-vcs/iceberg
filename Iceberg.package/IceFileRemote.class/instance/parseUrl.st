private
parseUrl
	| znUrl |
	znUrl := ZnUrl fromString: url defaultScheme: 'file'.
	path := znUrl asFileReference.
	projectName := path basename.
