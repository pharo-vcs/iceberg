tests
testExpectedLocationOfRightToolbarButtons

	self assert: (self expecteRightCommandClasses allSatisfy: [ :class | class defaultPosition = #right ])