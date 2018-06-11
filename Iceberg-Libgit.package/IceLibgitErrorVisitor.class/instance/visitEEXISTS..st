visiting
visitEEXISTS: anError

	(anError messageText beginsWith: 'Failed to write reference ''refs/tags')
		ifTrue: [ | refName messageStream|
			messageStream := anError messageText readStream.
			refName := messageStream
				upTo: $/;
				upTo: $/;
				upTo: $'.
			IceTagAlreadyExists new
				tagName: refName;
				signal ].
	self visitGenericError: anError