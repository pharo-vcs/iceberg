API-remotes
pullFrom: aRemote
	
	"This is a special operation: this branch is unborn.
	This means there is no local branch in ths repository.
	We shall then
	  - create a local branch tracking a remote branch with the same name
	  - pull from that branch
	
	If there is no branch in the remote repository with the same name, do nothing.
	"
	
	| remoteBranch |
	repository fetch.
	remoteBranch := aRemote remoteBranchNamed: self name ifAbsent: [ ^ self ].
	repository createBranch: self name inCommit: remoteBranch commit.