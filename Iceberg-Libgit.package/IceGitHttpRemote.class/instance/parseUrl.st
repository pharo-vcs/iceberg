private
parseUrl
	| znUrl |
	znUrl := ZnUrl fromString: url.
	user := znUrl username.
	host := znUrl host.
	port := znUrl port ifNil: [self class defaultPort].
	path := znUrl segments allButLast: 2.
	owner := (znUrl segments last: 2) first.
	projectName := self stripPossibleExtension: (znUrl segments last).