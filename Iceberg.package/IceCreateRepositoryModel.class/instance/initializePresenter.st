initialization
initializePresenter
	createButton action: [
		[	
			(IceRepository origin: remoteUrl text) register.
			self window delete. 
		]
		on: IceWrongUrl 
		do: [ UIManager default abort: 'The entered URL is not a valid scp repository URL.' ]].
