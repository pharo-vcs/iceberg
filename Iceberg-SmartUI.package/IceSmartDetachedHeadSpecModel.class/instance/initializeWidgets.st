initialization
initializeWidgets

	"WHAT"
	
	self actions do: [ :each | | newButton |
		newButton := self newButton.
		newButton label: each name.
		widgets at: each id put: newButton
	]