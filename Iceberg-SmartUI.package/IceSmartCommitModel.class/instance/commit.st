actions
commit
	| text |
	
	(text := self messageText) ifEmpty: [ ^ self ].
	UIManager default
		informUserDuring: [ :bar | 
			bar label: ('Commiting changes to {1}' format: { self repository asString }).
			self basicCommitWithMessage: text ifCancel: [ ^ self ] ].
	
	browser window delete.
	(IceRepositoryStatus for: self repository) openBrowser.