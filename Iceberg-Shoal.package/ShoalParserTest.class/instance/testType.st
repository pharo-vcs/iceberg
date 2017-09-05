tests
testType
	self assertParse: 'Class' rule: #type equals: 'Class'.
	self assertParse: 'Trait' rule: #type equals: 'Trait'.
	self assertParse: 'Extension' rule: #type equals: 'Extension'