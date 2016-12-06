tests - commit
testCommitAndReloadEmptyClass
	
	"1.1 - Commit a new version of the package, containing an empty class."
	repository loadPackage: packageName.
	Object
		subclass: #IcebergEmptyTestClass
		instanceVariableNames: '' 
		classVariableNames: '' 
		package: packageName.
	
	repository commitPackagesWithMessage: 'Trying to save an empty class'.

	"1.2 - Remove the package from the system."
	self removeTestPackages.
	Smalltalk at: #IcebergEmptyTestClass ifPresent: [ self fail: 'IcebergEmptyTestClass class was not correctly removed from system.' ].

	"2 - Reload the package"
	repository loadPackage: packageName.

	"3 - Test class should be here"
	self shouldnt: [ Smalltalk at: #IcebergEmptyTestClass ] raise: Error
	