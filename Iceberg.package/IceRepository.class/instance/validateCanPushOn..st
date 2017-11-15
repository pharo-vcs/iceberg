private validating
validateCanPushOn: aRemote
	| localBranch remoteBranch localCommit remoteCommit |

	localBranch := self branch.
	remoteBranch := localBranch upstreamFor: aRemote.
	remoteBranch ifNil: [ ^ self "it will be a new branch" ].
	
	localCommit := localBranch lastCommit.
	remoteCommit := remoteBranch lastCommit.
	(localCommit = remoteCommit 
		or: [ remoteCommit isAncestorOf: localCommit ])
		ifFalse: [ 
			IceRemoteDesynchronized new 
				remote: aRemote; 
				signal ]