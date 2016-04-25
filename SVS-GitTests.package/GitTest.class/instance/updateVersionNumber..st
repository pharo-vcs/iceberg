auxiliar
updateVersionNumber: expected
	| testClass |
	testClass := Smalltalk at: #Test.
	testClass compile: ('versionNumber ^ {1}' format: expected asString).
