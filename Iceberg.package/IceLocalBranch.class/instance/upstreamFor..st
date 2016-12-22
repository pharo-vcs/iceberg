private
upstreamFor: aRemote
	^ IceRemoteBranch 
		named: 'refs/remotes/', aRemote remoteName, '/', self name 
		inRepository: self repository