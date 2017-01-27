actions
cloneRepository
	self repositoryDirectory parent ensureCreateDirectory.

	IceGitCommand 
		in: self repositoryDirectory parent
		execute: {
			'clone'.
			branch ifNotNil: [ {'-b'. branch} ].
			"(readonly ifNil: false) ifTrue: {'--depth'. '1'}."
			remoteUrl.
			self repositoryDirectory basename
		}.

	"Force properties to be reloaded from new location.
	Copied from MCFileTreeRepository >> #directory:"
  	repositoryProperties := nil.	
  	self repositoryProperties	"NOW"
