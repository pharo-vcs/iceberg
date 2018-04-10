*Iceberg
createIcebergRepositoryFor: remoteUrl
	| builder repository |
	
	builder := IceRepositoryCreator new 
		url: remoteUrl;
		subdirectory: repoPath;
		commitishName: self projectVersion;
		yourself.

	[ repository := builder createRepository ]
	on: IceDuplicatedRepository 
	do: [ :e | 
		e resignalAs: (IceMetacelloDuplicatedNotification new
			builder: builder;
			yourself)  ].
	
	repository register.
	
	^ repository