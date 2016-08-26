initialization
initializePresenter
	message acceptBlock: [ :text | 
		text ifNotEmpty: [ 
			UIManager default informUserDuring: [ :bar | 
				bar label: ('Commiting to {1}' format: {self repository printString}).
				self model commitWithMessage: text asString ]]].
	
	commitButton action: [ message accept ].
