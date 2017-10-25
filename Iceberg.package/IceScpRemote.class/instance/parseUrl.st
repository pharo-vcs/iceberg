private
parseUrl
	| matcher |
	matcher := '(ssh\://)?([\w\-]+@)?([\w\-.]+)(\:[\d]+)?(\:|/)/?([\w\-]+)/([\w\-]+)(\.git)?' asRegex.
	(matcher matches: url) 
		ifTrue: [
			host := matcher subexpression: 4.
			owner := matcher subexpression: 7.
			projectName := matcher subexpression: 8.
		]
		ifFalse: [ IceWrongUrl signal: 'Could not parse URL: ', url ]
