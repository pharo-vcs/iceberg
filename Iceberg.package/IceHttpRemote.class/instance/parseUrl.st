private
parseUrl
	| znUrl |
	znUrl := ZnUrl fromString: url.
	user := znUrl username.
	host := znUrl host.
	port := znUrl port ifNil: [self class defaultPort].
	owner := znUrl segments first.
	projectName := self stripPossibleExtension: (znUrl segments second).