visiting
visitNoCommitMessage: aWarning
	| proceed |
	
	proceed := UIManager default
		confirm: aWarning messageText
		label: 'Warning!'  
		trueChoice: 'Commit' 
		falseChoice: 'Cancel'
		cancelChoice: nil
		default: false.
	
	proceed ifNil: [ ^ self ].
	proceed ifTrue: [ aWarning resume ]