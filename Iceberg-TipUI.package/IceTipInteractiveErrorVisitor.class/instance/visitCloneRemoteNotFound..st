visiting
visitCloneRemoteNotFound: anError
	UIManager default 
		alert: ('The clone remote {1} could not been found' format: { anError remoteUrl })
		title: 'Clone action failed'	