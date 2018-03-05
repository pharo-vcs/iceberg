actions
doCommit: aCollection message: aString pushing: aBoolean
	self model 
		commit: (IceTipCommitAction new
			diff: self model workingCopyDiff;
			items: aCollection;
			message: aString;
			publish: aBoolean;
			yourself)
		then: [ 
			self model reset.
			self commentPanel clear.
			self refresh	 ]