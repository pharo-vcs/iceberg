private
basicCommitWithMessage: text
	UIManager default informUserDuring: [ :bar | 
		bar label: ('Commiting to {1}' format: {self repository printString}).
		[
			self repository commit: self model withMessage: text asString.
			self message text: ''.
			self uiManager inform: ('Commited with message ', text) ]
		on: NothingToCommitException 
		do: [ :e | UIManager default inform: 'There is nothing to commit.' ] ]