repository handling
createRepository: branchName
	| newBackend |

	newBackend := (self storageClass 
		newRepositoryAt: self location
		origin: self origin
		subdirectory: (self subdirectory ifNil: '')).
	
	branchName ifNotNil: [ newBackend branch: branchName ].
	origin ifNil: [ origin := IceRemote url: newBackend remoteUrl ].

	(self location exists not or: [ self location hasChildren not ])
		ifTrue: [ newBackend cloneRepository ].

	self backend: newBackend