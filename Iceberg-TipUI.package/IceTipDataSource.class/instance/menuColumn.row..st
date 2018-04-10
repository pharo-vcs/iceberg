accessing
menuColumn: column row: rowIndex
	| menuSelection context |
	
	rowIndex = 0 ifTrue: [ ^ nil ].
	menuSelection := self elementAt: rowIndex.
	context := self menuSelectionContextWithSelection: menuSelection.		
	^ CmdContextMenuCommandActivation 	
		buildContextMenuFor: self table 
		inContext: context