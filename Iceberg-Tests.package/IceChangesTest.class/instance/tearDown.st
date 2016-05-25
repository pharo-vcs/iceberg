running
tearDown
	super tearDown.
	Smalltalk globals at: #ForExtensionMethods ifPresent: #removeFromSystem