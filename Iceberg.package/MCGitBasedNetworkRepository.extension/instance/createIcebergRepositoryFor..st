*Iceberg-Adapters
createIcebergRepositoryFor: remoteUrl
	| builder repository |
	
	builder := IceRepositoryCreator new 
		url: remoteUrl;
		subdirectory: repoPath;
		branchName: self projectVersion;
		yourself.

	[ repository := builder createRepository ]
	on: IceDuplicatedRepository 
	do: [ :e | 
		e resignalAs: (IceMetacelloDuplicatedNotification new
			builder: builder;
			yourself)  ].
	
	repository register.
	
	^ repository