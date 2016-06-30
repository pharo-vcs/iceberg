private
clone
	self localRepository parent ensureCreateDirectory.

	IceGitCommand 
		in: self localRepository parent 
		execute: {
			'clone'.
			branch notNil ifTrue: {'-b'. branch}.
			"(readonly ifNil: false) ifTrue: {'--depth'. '1'}."
			remoteUrl.
			self localRepository basename
		}.
