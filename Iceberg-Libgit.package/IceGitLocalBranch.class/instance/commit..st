accessing
commit: anIceGitCommit 
	
	"Update the branch to point to a commit.
	If the branch is HEAD, check it out in disk also."
	repository withRepoDo: [ :repo | | localBranch gitcommit |
		localBranch := repo lookupLocalBranch: self name.
		gitcommit := repo revparse: anIceGitCommit id.
		localBranch setTargetId: gitcommit id.

		self = repository head
			ifTrue: [ repo
					checkout_treeish: gitcommit
					opts: (LGitCheckoutOptions defaults
						checkoutStrategy: LGitCheckoutStrategyEnum git_checkout_force;
						yourself) ].	
	 ].