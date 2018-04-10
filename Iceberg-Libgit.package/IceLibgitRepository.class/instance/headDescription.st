printing
headDescription
	
	^ [ super headDescription ] on: Error do: [ 'Bad location' ]