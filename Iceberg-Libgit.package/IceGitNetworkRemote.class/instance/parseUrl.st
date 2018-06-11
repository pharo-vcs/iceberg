accessing
parseUrl
	| znUrl |
	znUrl := ZnUrl fromString: url.
	user := znUrl username.
	host := znUrl host.
	port := znUrl port ifNil: [self class defaultPort].
	path := znUrl segments allButLast: 2.
	
	znUrl segments size >= 2
		ifTrue: [ owner := (znUrl segments last: 2) first ].

	znUrl segments isEmpty ifTrue: [ IceWrongUrl signal: 'Remote repository scheme not supported: ', url ].
	projectName := self stripPossibleExtension: (znUrl segments last).