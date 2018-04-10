execution
execute
	| result |
	
	result := UIManager default 
		request: 'Groups to install (a comma separated string)' 
		initialAnswer: '' 
		title: 'Enter groups to install'.
	result ifNil: [ ^ self ].
	
	self 
		installBaseline: self package
		groups: ((result substrings: ',') 
			collect: #trimmed 
			as: Array)