tests
testCommitWithoutPesosSign
	"We used to have a problem that in some messages (depending of padding) the $ was added at the end"
	| msg |
	msg := '123456789'.
	self repository commitWithMessage: msg.
	self assert: self repository head commit comment equals: msg.
