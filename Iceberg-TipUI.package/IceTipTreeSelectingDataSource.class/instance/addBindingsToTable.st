private
addBindingsToTable	
	self table
		bindKeyCombination: Character space 
		toAction: [ self toggleSelectionOf: self selectedItem ]