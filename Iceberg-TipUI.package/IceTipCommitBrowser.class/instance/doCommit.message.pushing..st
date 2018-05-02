actions
doCommit: aCollection message: aString pushing: aBoolean
	self model
		commit:
			(IceTipCommitAction new
				diff: self model workingCopyDiff;
				items: aCollection;
				message: aString;
				yourself)
		then: [ self verifyNeedsRefreshOrClose.
			aBoolean
				ifTrue: [ (IceTipPushAction new repository: self model entity) execute ] ]