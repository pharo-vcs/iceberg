actions
pull
	self backend pull.
	self refresh.
	self loadedPackages do: #loadLatest.
