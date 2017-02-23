private
parseUrl
	| matcher |
	matcher := '((http|https)\://)(([\w]+)@)*([\w.]+)(\:([\d]+))*(/[\w]+)*/([\w]+)/([\w]+(.git)?)' asRegex.
	(matcher matches: url) 
		ifTrue: [		
		 
			user := matcher subexpression: 5.
			host := matcher subexpression: 6.
			port := (matcher subexpression: 8) 
							ifNil: [ self class defaultPort ] 
							ifNotNil: [: x | x asInteger ].				 
			path := (matcher subexpressions: 9)
							inject: OrderedCollection new 
							into: [:coll :each  | coll add: each allButFirst. coll ]. 
			owner := matcher subexpression: 10.
			projectName := matcher subexpression: 11.
		]
		ifFalse: [ IceWrongUrl signal: 'Could not parse URL: ', url ]
