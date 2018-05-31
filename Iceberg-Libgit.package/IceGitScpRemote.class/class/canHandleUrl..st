testing
canHandleUrl: aUrl
	"Very simplistic implementation that does not cover all cases. Either there
	is the ssh scheme or treat all non absolute paths as SSH"

	^ (self isSSHUrl: aUrl) or: [ self isAlternateSSHUrl: aUrl ]