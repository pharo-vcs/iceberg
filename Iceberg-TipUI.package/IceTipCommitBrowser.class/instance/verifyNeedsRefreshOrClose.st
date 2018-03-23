private
verifyNeedsRefreshOrClose
	"Verifies if there are remaining changes to commit. 
	 In case there are none, close the window."
	
	self model reset.
	diffPanel model reset.
	diffPanel model isEmpty
		ifTrue: [ ^ self window close ].
	self commentPanel clear. 
	diffPanel basicRefresh