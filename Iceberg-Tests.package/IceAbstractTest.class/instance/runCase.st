running
runCase
	Transcript show: 'starting to run case', self printString.
	EpMonitor current disable.
	Transcript show: 'after epicea', self printString.
	[ super runCase.
		Transcript show: 'after super runCase', self printString.
 ] ensure: [ 
	Transcript show: 'in ensure', self printString.
		EpMonitor current enable.
			Transcript show: 'after ensure', self printString.
 ]