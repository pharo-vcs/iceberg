instance creation
origin: url location: location
	^ self new 
		location: location;
		origin: (IceRemote url: url);
		yourself
