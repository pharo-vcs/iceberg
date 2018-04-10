MonticelloGUI
morphicOpen: workingCopy
	| shouldOpenIceberg |
	shouldOpenIceberg := UIManager default 
		confirm: ('{1} belongs to {2} and cannot be browsed here. 
Do you want to open the Iceberg Browser instead?' format: { workingCopy packageName. self repository name }) 
		label: 'Browsing an iceberg repository'
		trueChoice: 'Open' 
		falseChoice: 'Cancel'
		cancelChoice: nil
		default: true.
	shouldOpenIceberg ifFalse: [ ^ self ].
	IceTipRepositoriesBrowser new openWithSpec