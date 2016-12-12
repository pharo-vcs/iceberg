private
parseUrl
	| matcher |
	matcher := 'https\://([\w.]+)/([\w\-]+)/([\w\-]+)(\.git)?' asRegex.
	(matcher matches: url) 
		ifTrue: [
			host := matcher subexpression: 2.
			owner := matcher subexpression: 3.
			projectName := matcher subexpression: 4.
		]
		ifFalse: [ IceWrongUrl signal: 'Could not parse URL: ', url ]
