running
runCase
	Transcript cr; show: 'starting to run case', self printString; cr.
	EpMonitor current disable.
	Transcript show: 'after epicea';cr.
	[
		[ 
			super runCase.
			Transcript show: 'after super runCase';cr.
 		] 
		on: Error do: [ :error | 
			Transcript show: 'Error: ', error description; cr.
			error pass
		]
 	] 
	ensure: [ 
		Transcript show: 'in ensure';cr.
		EpMonitor current enable.
		Transcript show: 'after ensure';cr.
 	]