accessing
commit: anIceGitCommit
	"Update the branch to point to a commit.
	If the branch is HEAD, check it out in disk also."

	repository handleLibgitError: [ | localBranch gitcommit |
		localBranch := self repositoryHandle lookupLocalBranch: self name.
		gitcommit := self repositoryHandle revparse: anIceGitCommit id.
		localBranch setTargetId: gitcommit id.
		self = repository head
			ifTrue: [ self repositoryHandle
					checkout_treeish: gitcommit
					opts:
						(LGitCheckoutOptions defaults
							checkoutStrategy: LGitCheckoutStrategyEnum git_checkout_force;
							yourself) ]]