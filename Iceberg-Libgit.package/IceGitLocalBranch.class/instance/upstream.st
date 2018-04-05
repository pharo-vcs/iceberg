private-tracking
upstream
	
	^ self upstreamIfNone: [ IceUpstreamNotConfigured signal ]