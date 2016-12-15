private accessing
defaultLocation
	self flag: #todo. "move #repositoriesLocation to here?"
	^ IceRepository repositoriesLocation / self remote organizer / self remote projectName