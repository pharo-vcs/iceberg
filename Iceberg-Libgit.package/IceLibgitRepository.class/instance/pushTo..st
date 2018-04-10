actions
pushTo: aRemote
	| gitRemote reference remoteBranchName |
	self validateCanPushTo: aRemote.
	gitRemote := (LGitRemote of: self repositoryHandle named: aRemote name) lookup.
	reference := self repositoryHandle head.
	remoteBranchName := reference name.	"TODO: https://github.com/npasserini/iceberg/issues/90"
	[ gitRemote
		pushWithRefSpec:
			(LGitRefSpec new
				source: reference name;
				destination: remoteBranchName;
				yourself)
		pushOptions:
			(LGitPushOptions defaults
				callbacks: (LGitRemoteCallbacks withProvider: IceCredentialsProvider default);
				yourself) ]
		on: LGit_GIT_ENONFASTFORWARD
		do: [ :e | 
			e
				resignalAs:
					(IceRemoteDesynchronized new
						remote: aRemote;
						yourself) ].

	"Since the push created the branch in the remote, we can now add an upstream to this branch."
	reference upstream ifNil: [ reference setUpstream: aRemote name , '/' , reference basename ]