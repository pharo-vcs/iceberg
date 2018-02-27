actions
doCommit: items message: aString pushing: aBoolean
	self validateMessage: aString.
	self model 
		commit: (IceTipCommitAction new
			items: items;
			message: aString;
			publish: aBoolean;
			yourself)
		then: [ 
			self model reset.
			self refresh	 ]