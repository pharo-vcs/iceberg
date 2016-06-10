tests
testExtensionMethodAddition
	| class diff elements |
	
	"Prepare"
	repository loadPackage: packageName.
	class := Object subclass: #ForExtensionMethods.
	class compile: 'myExtensionMethod'.
	class organization classify: #myExtensionMethod under: '*', packageName.
	
	"Asserts"
	diff := IceDiff forRepository: repository.
	self assert: diff changes notEmpty.
	
	elements := diff elements.
	self assert: elements notEmpty.
	
	self assert: (elements detect: [:elem | elem description = packageName ]) changes notEmpty.
	
