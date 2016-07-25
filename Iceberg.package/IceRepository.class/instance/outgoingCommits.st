commits
outgoingCommits
	^ [ self backend outgoingCommits ] on: IceNoRemoteBranch do: [ self commits ]
