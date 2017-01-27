instance creation
newRepositoryAt: directory subdirectory: subdirectory
	^ self new
		location: directory subdirectory: subdirectory;
		readonly: false.
