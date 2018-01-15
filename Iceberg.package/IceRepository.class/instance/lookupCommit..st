private
lookupCommit: commitId

	^ [
		self newCommitWalk 
			fromCommitId: commitId; 
			firstCommit ]
				on: LGit_GIT_ENOTFOUND
				do: [ :error | IceGitUnknownCommit new id: commitId; yourself ]