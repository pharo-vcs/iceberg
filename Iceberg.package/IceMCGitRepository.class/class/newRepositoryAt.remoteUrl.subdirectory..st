instance creation
newRepositoryAt: directory remoteUrl: remoteUrl subdirectory: subdirectory
	^ self new
		location: directory subdirectory: subdirectory;
		remoteUrl: remoteUrl;
		readonly: false.
