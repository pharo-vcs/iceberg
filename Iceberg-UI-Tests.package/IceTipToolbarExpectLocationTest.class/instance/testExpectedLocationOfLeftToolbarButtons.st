tests
testExpectedLocationOfLeftToolbarButtons

	self assert: (self expecteLeftCommandClasses allSatisfy: [ :class | class defaultPosition = #left ])