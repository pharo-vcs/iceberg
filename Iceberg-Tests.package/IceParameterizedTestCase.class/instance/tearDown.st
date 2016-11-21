running
tearDown
	self testParameters do: [ :parameter |
		[ parameter deactivate ] on: Error do: [ :error | error logCr ] ].
	
	
