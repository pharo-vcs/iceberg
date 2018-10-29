private
wait: time thenDo: aBlock
	"This method avoids to request too many times the github api. 
	 It does it in the simplest way possible: it starts a process that waits some 
	 time (usually 500 milliseconds). If there is another entry before, it terminates 
	 the process and starts a new one."

	currentWaitingProcess ifNotNil: [ currentWaitingProcess terminate ].
	currentWaitingProcess := [ 
			time wait.
			aBlock value ] 
		forkNamed: 'GitHub issue tracker'