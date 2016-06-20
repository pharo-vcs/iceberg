initialization
initializePresenter
	createButton action: [
		[	| repository |
			repository := IceRepository origin: remoteUrl text.
			subdirectory text ifNotNil: [ :text | repository subdirectory: text ].
			repository register.
			
			self window delete. 
		]
		on: IceWrongUrl 
		do: [ UIManager default abort: 'The entered URL is not a valid scp repository URL.' ]].
