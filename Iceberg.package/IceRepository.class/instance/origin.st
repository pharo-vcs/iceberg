accessing remotes
origin
	^ [ self backend origin ]
		on: LGit_GIT_ENOTFOUND 
		do: [ :error | "if local repository is deleted, LGit_GIT_ENOTFOUND will be thrown. We already know the origin"
				{ self pullRemote . self pushRemote }
					detect: #isOrigin
					ifNone: [ error pass ] ]