testing
canHandleUrl: aRepositoryUrl
	^ (aRepositoryUrl beginsWith: 'file:') or: [aRepositoryUrl beginsWith: '/']