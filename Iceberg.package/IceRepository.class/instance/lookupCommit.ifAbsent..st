private
lookupCommit: commitId ifAbsent: absentBlock

	^ [
		self newCommitWalk 
			fromCommitId: commitId; 
			firstCommit ]
				on: LGit_GIT_ENOTFOUND
				do: [ :error | absentBlock value ]