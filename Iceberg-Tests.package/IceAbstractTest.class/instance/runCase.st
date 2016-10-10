running
runCase
	"Disable epicea while running tests. 
	Check for #ifNotNil for being able to run in a Pharo 5,
	which does not have Epicea by default."
	
	EpMonitor ifNotNil: [ EpMonitor current disable ].
	[ super runCase ]
		ensure: [ EpMonitor ifNotNil: [ EpMonitor current enable ]]