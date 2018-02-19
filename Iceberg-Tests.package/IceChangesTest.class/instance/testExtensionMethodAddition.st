tests
testExtensionMethodAddition
	| class diff elements |
	
	"Prepare"
	repository checkoutPackageNamed: packageName.
	class := Object subclass: #ForExtensionMethods.
	class compile: 'myExtensionMethod'.
	class organization classify: #myExtensionMethod under: '*', packageName.
	
	"Asserts"
	diff := IceRootNode forRepository: repository.
	
	elements := diff elements.
	self assert: elements notEmpty.
	
	self assert: (elements detect: [:elem | elem description = packageName ]) changes notEmpty.
	
