instance creation
origin: url location: location
	self halt. 
	^ self new 
		location: location;
		origin: (IceRemote url: url);
		yourself
