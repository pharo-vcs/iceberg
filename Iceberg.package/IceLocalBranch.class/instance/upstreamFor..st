private
upstreamFor: aRemote
	^ IceRemoteBranch 
		remoteName: aRemote remoteName
		branchName: self name
		inRepository: self repository