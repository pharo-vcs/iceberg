instance creation
for: aMCClassDefinition 
	^ self new
		targetClassName: aMCClassDefinition className;
		package: (Ice packageForCategoryNamed: aMCClassDefinition category)
		yourself