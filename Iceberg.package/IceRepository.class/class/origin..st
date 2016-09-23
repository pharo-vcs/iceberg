instance creation
origin: url
	^ self basicNew
		origin: (IceRemoteRepository url: url);
		initialize;
		yourself