accessing remotes
remotes
	| gitRemotes |
	self isValid
		ifFalse: [ ^ #() ].
	gitRemotes := self repositoryHandle allRemotes.
	^ gitRemotes
		collect: [ :each | 
			(IceGitRemote name: each remoteName url: each url)
				localRepository: self;
				yourself ]