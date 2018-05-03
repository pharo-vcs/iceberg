API-accessing
commitishNamed: aName
	"Resolve a name in the form of:
	  - a commit hash
	  - a branch name
	  - some other expression such as HEAD or master~1
	and return the corresponding iceberg object for it."

	^ self
		branchNamed: aName
		ifAbsent: [ "If there is a single remote, we can look for the branch in this single remote."
			self remotes size = 1
				ifTrue: [ self remotes anyOne
						remoteBranchNamed: aName
						ifPresent: [ :found | ^ found ]
						ifAbsent: [ "Continue with the revparse" ] ].
			self revparse: aName ]