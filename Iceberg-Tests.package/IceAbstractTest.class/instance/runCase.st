running
runCase
	EpMonitor current disable.
	[ super runCase ] ensure: [ 
		EpMonitor current enable ]