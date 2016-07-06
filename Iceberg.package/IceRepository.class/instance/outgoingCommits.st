querying
outgoingCommits
	^ [ self backend outgoingCommits ] on: IceNoRemoteBranch do: [ self allCommits ]
