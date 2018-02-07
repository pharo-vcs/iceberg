private
doAccept
	^ [ 	
		self selectedType validate.
		acceptAction cull: self selectedType newRepository.
		true ]
	on: AssertionFailure 
	do: [ :e | 
		UIManager default alert: e messageText title: 'Error'.
		false ]		