actions
cloneRepository
"	| url |
"	"TODO (issue #81): Cloning with https doesn't require credentials. This is done because of a bug between libgit2/libssh2 which keeps ssh authentication from working. Yet, our current tests do not use this behavior so it is not clear that it works. Moreover, I tested that ssh does not work with clone, but this implementation suggests that it might work for other commands (?). "
"	url := (self origin url includes: $@)
		ifTrue: [ 'https://' , ((self origin url copyAfter: $@) copyUpTo: $:) , '/' , (self origin url copyAfterLast: $:) ]
		ifFalse: [ self origin url ].
"
	LGitGlobal runSequence: [ 
		| repo |
		repo := LGitRepository on: self location.
		repo
			cloneSsh: self origin url;
			checkout: self branch.

		(LGitRemote of: repo named: 'origin')
			lookup;
			setUrl: self origin url
	]
