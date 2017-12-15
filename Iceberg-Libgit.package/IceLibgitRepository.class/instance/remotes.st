accessing remotes
remotes
	| gitRemotes |
	self isValid ifFalse: [ ^ #() ].
	self withRepoDo: [ :repo | gitRemotes := repo allRemotes ].
	^ gitRemotes collect: [ :each | 
		(IceGitRemote name: each remoteName url: each url)
			localRepository: self;
			yourself ]