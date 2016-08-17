auxiliar
createConflictingModification
	"Modify and commit the test package, in a way that it will conflict with the main modifications these tests do."

	| testClass nextVersionNumber | 
	
	"1 - Ensure the package is loaded"
	repository loadPackage: packageName.

	"2 - Add a non conflicting method"
	testClass := Smalltalk at: #Test.
	nextVersionNumber := testClass new versionNumber + 1.
	testClass compile: ('versionNumber ^ ''Created for conflicting with version {1}''' format: {nextVersionNumber}).

	"3 - Commit"
	repository 
		savePackage: packageName 
		withMessage: ('Created conflicting method with version {1}' format: { nextVersionNumber }).
