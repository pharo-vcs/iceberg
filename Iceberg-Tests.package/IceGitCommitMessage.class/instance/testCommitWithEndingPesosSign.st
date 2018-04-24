tests
testCommitWithEndingPesosSign
	"We used to have a problem that in some messages (depending of padding) the $ was added at the end"
	| msg |
	msg := 'Adding Tests to making obsolete a class.'.
	repository commitWithMessage: msg.
	self assert: repository head commit comment equals: msg.
