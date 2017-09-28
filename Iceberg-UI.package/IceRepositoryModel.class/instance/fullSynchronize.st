actions
fullSynchronize
	(UIManager default 
		confirm: 'This will scan the full repository looking for differences. 
In big repositories, this can be a very slow task.
Do you want to continue?' 
		label: 'Warning!'
		trueChoice: 'Yes, make the diff' 
		falseChoice: 'No, forget I asked'
		cancelChoice: nil
		default: false)
	ifFalse: [ ^ self ].
	IceSynchronizeBrowser fullSynchronize: self repository