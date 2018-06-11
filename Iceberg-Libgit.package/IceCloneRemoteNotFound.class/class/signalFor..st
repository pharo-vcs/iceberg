signalling
signalFor: aUrl
	^ self new
		remoteUrl: aUrl;
		signal.