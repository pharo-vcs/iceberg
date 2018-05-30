private
parseUrl
	| matcher |
	matcher := '(git\://)?([\w\-]+@)?([\w\-.]+)(\:[\d]+)?(\:|/)/?([\w\-]+)(/([\w\-]+))*(\.git)?' asRegex.
	(matcher matches: url) 
		ifTrue: [
			host := matcher subexpression: 4.
			owner := matcher subexpression: matcher subexpressionCount - 3.
			projectName := matcher subexpression: matcher subexpressionCount - 1.
		]
		ifFalse: [ IceWrongUrl signal: 'Could not parse URL: ', url ]
