visiting
visitCloneLocationAlreadyExists: anError 
	UIManager default 
		alert: ('The clone location {1} already exists' format: { anError location })
		title: 'Clone action failed'	