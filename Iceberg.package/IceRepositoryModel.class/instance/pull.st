actions
pull
	self repository isModified
		ifTrue: [ | confirm |
			confirm := IceTool uiManager
				confirm:
					'Your repository has uncommited changes. Merging incomming commits will change
your current working copy and your current state will not be recoverable. 
We recommend that you commit first and then pull incomming changes again.'
				label: 'You might loose your current changes!'
				trueChoice: 'Proceed anyway'
				falseChoice: 'Cancel'
				cancelChoice: nil
				default: false.
			confirm
				ifFalse: [ ^ self ] ].
	self repository pull