instance creation
newRepositoryAt: directory origin: origin subdirectory: subdirectory
	^ self new
		location: directory subdirectory: subdirectory;
		remoteUrl: (origin ifNotNil: #url);
		readonly: false.
