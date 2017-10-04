testing
canHandleUrl: aRepositoryUrl
	"Very simplistic implementation that does not cover all cases. Either there
	is the ssh scheme or treat all non absolute paths as SSH"
	^ (aRepositoryUrl beginsWith: 'ssh://')
		or: [
			(aRepositoryUrl includesSubstring: '://') not and: [(aRepositoryUrl beginsWith: '/') not]].