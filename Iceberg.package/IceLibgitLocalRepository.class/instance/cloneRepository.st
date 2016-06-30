actions
cloneRepository
	| url |
	"cloning with https doesn't require credentials"
	url := (self origin url includes: $@)
		ifTrue: [ 'https://' , ((self origin url copyAfter: $@) copyUpTo: $:) , '/' , (self origin url copyAfterLast: $:) ]
		ifFalse: [ self origin url ].

	LGitGlobal runSequence: [ 
		| repo |
		repo := LGitRepository on: self location.
		repo
			clone: url;
			checkout: 'master'.

		(LGitRemote of: repo named: 'origin')
			lookup;
			setUrl: self origin url
	]
