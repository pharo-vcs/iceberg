auxiliar
createNonConflictingModification
	"Modify and commit the test package, in a way that it will not conflict with the main modifications these tests do."

	| testClass nextVersionNumber | 
	
	"1 - Ensure the package is loaded"
	repository loadPackageNamed: packageName.

	"2 - Add a non conflicting method"
	testClass := Smalltalk at: #Test.
	nextVersionNumber := testClass new versionNumber + 1.
	testClass compile: ('nonConflictingMethod ^ {1}' format: { nextVersionNumber }).

	"3 - Commit"
	repository commitWithMessage: ('Created non conflicting method with version {1}' format: { nextVersionNumber }).
