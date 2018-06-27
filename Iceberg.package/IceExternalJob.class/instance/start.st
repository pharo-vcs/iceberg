events
start
	started := true.

	Job jobAnnouncer announce: (JobStart on: self)