private - patches
parseUrl
	| urlStream restSegments |
	(self isSSHUrl: url)
		ifTrue: [ ^ super parseUrl ].
	
	(self isAlternateSSHUrl: url) ifFalse: [ IceWrongUrl signal: 'Remote repository scheme not supported: ', url ].
	
	"We now parse alternate ssh urls like lars@myserver.example.com:repos/myrepo.git"
	urlStream := url readStream.
	user := urlStream upTo: $@.
	host := (urlStream upTo: $:) ifEmpty: [ nil ].
	restSegments := urlStream upToEnd substrings: '/'.
	
	path := restSegments size >= 2
		ifTrue: [ restSegments allButLast: 2 ]
		ifFalse: [ #() ].
	owner := restSegments size > 1
		ifTrue: [ restSegments at: (restSegments size - 1) ]
		ifFalse: [ nil ].

	restSegments isEmpty ifTrue: [ IceWrongUrl signal: 'Remote repository scheme not supported: ', url ].
	projectName := self stripPossibleExtension: (restSegments last)