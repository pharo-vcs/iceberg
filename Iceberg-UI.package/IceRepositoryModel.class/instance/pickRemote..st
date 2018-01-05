private
pickRemote: aTitle
	| remotes |
	 
	remotes := self repository remotes.
	^ UIManager default
		chooseFrom: (remotes collect: #name)
		values: remotes
		message: 'Select the remote you want to use:' 
		title: aTitle