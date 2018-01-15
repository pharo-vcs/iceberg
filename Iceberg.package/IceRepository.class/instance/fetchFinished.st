actions
fetchFinished

	"When a fetch is performed, we need to check if possibly unknown commits are now available to put them up-to-date."
	
	self workingCopy fetchFinished