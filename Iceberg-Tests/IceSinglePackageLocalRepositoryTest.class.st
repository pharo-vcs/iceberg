Class {
	#name : 'IceSinglePackageLocalRepositoryTest',
	#superclass : 'IceBornRepositoryTest',
	#category : 'Iceberg-Tests-Common',
	#package : 'Iceberg-Tests',
	#tag : 'Common'
}

{ #category : 'testing' }
IceSinglePackageLocalRepositoryTest class >> isAbstract [

	^ self == IceSinglePackageLocalRepositoryTest 
]

{ #category : 'tests-changes' }
IceSinglePackageLocalRepositoryTest >> testAddClassInstanceVariableIsExportedInCommit [

	| diff |
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: 'First class'.

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol
		with: [ :class | class metaclass instanceVariables: #(someClassInstVar) ].

	self repository commitWithMessage: 'Added class instance variable'.

	diff := self repository headCommit diffToParent.
	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value isModification.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value definition isClassDefinition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value definition name equals: #'IceGeneratedClassForTesting class'.
]

{ #category : 'tests-changes' }
IceSinglePackageLocalRepositoryTest >> testAddClassInstanceVariableIsExportedInCommitSecondVariable [

	| diff |
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: 'First class'.

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol
		with: [ :class | class metaclass instanceVariables: #(someClassInstVar) ].

	self repository commitWithMessage: 'Added class instance variable'.	

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol
		with: [ :class | class metaclass instanceVariables: #(someClassInstVar anotherClassInstVar) ].

	self repository commitWithMessage: 'Added another class instance variable'.

	diff := self repository headCommit diffToParent.
	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value isModification.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value definition isClassDefinition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value definition name equals: #'IceGeneratedClassForTesting class'.
]

{ #category : 'tests-changes' }
IceSinglePackageLocalRepositoryTest >> testChangeClassSideMakesChangesContainClassDefinition [

	| diff |
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: 'First class'.

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol
		with: [ :class | class metaclass instanceVariables: #(someClassInstVar) ].

	diff := self repository workingCopyDiff.
	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value isModification.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value definition isClassDefinition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value definition name equals: #'IceGeneratedClassForTesting class'.
]

{ #category : 'tests-changes' }
IceSinglePackageLocalRepositoryTest >> testChangeClassSideMakesIsExportedInCommit [

	| diff |
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: 'First class'.

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol
		with: [ :class | class metaclass instanceVariables: #(someClassInstVar) ].

	self repository commitWithMessage: 'Added class instance variable'.

	diff := self repository headCommit diffToParent.
	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value isModification.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value definition isClassDefinition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value definition name equals: #'IceGeneratedClassForTesting class'.
]

{ #category : 'tests-changes' }
IceSinglePackageLocalRepositoryTest >> testChangeClassSideMakesIsExportedInCommitSecondVariable [

	| diff |
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: 'First class'.

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol
		with: [ :class | class metaclass instanceVariables: #(someClassInstVar) ].

	self repository commitWithMessage: 'Added class instance variable'.	

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol
		with: [ :class | class metaclass instanceVariables: #(someClassInstVar anotherClassInstVar) ].

	self repository commitWithMessage: 'Added another class instance variable'.

	diff := self repository headCommit diffToParent.
	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value isModification.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value definition isClassDefinition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value definition name equals: #'IceGeneratedClassForTesting class'.
]

{ #category : 'tests-changes' }
IceSinglePackageLocalRepositoryTest >> testChangeClassWithClassSideTraitsCompositionIsExported [

	| diff |
	"This is a Ring working copy"

	self repository workingCopy createTrait: 'T1' inPackage: self packageName1 asSymbol.

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' inPackage: self packageName1 asSymbol with: [ :class | 
				| composition transformations classSideComposition classSideTransformations| 
				composition := RGTraitComposition parent: class.
				transformations := RGTraitCompositionVisitor new parse: 'T1' for: composition.
				class traitComposition: composition.
				transformations do: [ :each |
					composition addTransformation: each ].
			
				classSideComposition := RGTraitComposition parent: class classSide.
				classSideTransformations := RGTraitCompositionVisitor new 
					parse: 'T1 classTrait - {#m1}' for: classSideComposition.
				class classSide traitComposition: classSideComposition.
				classSideTransformations do: [ :each | 
					classSideComposition addTransformation: each ]].
		
	self repository commitWithMessage: 'First class'.

	diff := self repository headCommit diffToParent.
	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 4.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') 
					value definition asMCDefinition hasClassTraitComposition.
	self 
			assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value definition asMCDefinition classTraitComposition 
			equals: '(T1 classTrait - {#m1})'.

]

{ #category : 'tests-changes' }
IceSinglePackageLocalRepositoryTest >> testChangeClassWithClassSideTraitsCompositionIsExportedInSecondCommit [

	| diff |
	"This is a Ring working copy"

	self repository workingCopy createTrait: 'T1' inPackage: self packageName1 asSymbol.

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' inPackage: self packageName1 asSymbol with: [ :class | 
				| composition transformations classSideComposition classSideTransformations| 
				composition := RGTraitComposition parent: class.
				transformations := RGTraitCompositionVisitor new parse: 'T1' for: composition.
				class traitComposition: composition.
				transformations do: [ :each |
					composition addTransformation: each ].
			
				classSideComposition := RGTraitComposition parent: class classSide.
				classSideTransformations := RGTraitCompositionVisitor new 
					parse: 'T1 classTrait' for: classSideComposition.
				class classSide traitComposition: classSideComposition.
				classSideTransformations do: [ :each | 
					classSideComposition addTransformation: each ]].
		
	self repository commitWithMessage: 'First class'.

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' inPackage: self packageName1 asSymbol with: [ :class | 
				| composition transformations classSideComposition classSideTransformations| 
				composition := RGTraitComposition parent: class.
				transformations := RGTraitCompositionVisitor new parse: 'T1' for: composition.
				class traitComposition: composition.
				transformations do: [ :each |
					composition addTransformation: each ].
			
				classSideComposition := RGTraitComposition parent: class classSide.
				classSideTransformations := RGTraitCompositionVisitor new 
					parse: 'T1 classTrait - {#m1}' for: classSideComposition.
				class classSide traitComposition: classSideComposition.
				classSideTransformations do: [ :each | 
					classSideComposition addTransformation: each ]].
		
	self repository commitWithMessage: 'Second commit'.


	diff := self repository headCommit diffToParent.
	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value isModification.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') 
					value definition asMCDefinition hasClassTraitComposition.
	self 
			assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value definition asMCDefinition classTraitComposition 
			equals: '(T1 classTrait - {#m1})'.

]

{ #category : 'tests-changes' }
IceSinglePackageLocalRepositoryTest >> testChangeClassWithTraitsSideMakesIsExportedInCommit [

	| diff |
	"This is a Ring working copy"

	self repository workingCopy createTrait: 'T1' inPackage: self packageName1 asSymbol.

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' inPackage: self packageName1 asSymbol with: [ :class | 
			| composition transformations | 
			composition := RGTraitComposition parent: class.
			transformations := RGTraitCompositionVisitor new parse: 'T1' for: composition.
			class traitComposition: composition.
			transformations do: [ :each |
				composition addTransformation: each ]
			].

	self repository commitWithMessage: 'First class'.

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol
		with: [ :class | class metaclass instanceVariables: #(someClassInstVar) ].

	self repository commitWithMessage: 'Added class instance variable'.

	diff := self repository headCommit diffToParent.
	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value isModification.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value definition isClassDefinition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value definition name equals: #'IceGeneratedClassForTesting class'.
]

{ #category : 'tests-changes' }
IceSinglePackageLocalRepositoryTest >> testChangeClassWithTraitsSideMakesIsExportedInCommitSecondVariable [

	| diff |
	"This is a Ring working copy"

	self repository workingCopy createTrait: 'T1' inPackage: self packageName1 asSymbol.

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' inPackage: self packageName1 asSymbol with: [ :class | 
			| composition transformations | 
			composition := RGTraitComposition parent: class.
			transformations := RGTraitCompositionVisitor new parse: 'T1' for: composition.
			class traitComposition: composition.
			transformations do: [ :each |
				composition addTransformation: each ]
			].

	self repository commitWithMessage: 'First class'.

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol
		with: [ :class | class metaclass instanceVariables: #(someClassInstVar) ].

	self repository commitWithMessage: 'Added class instance variable'.
	
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol
		with: [ :class | class metaclass instanceVariables: #(someClassInstVar otherClassVariable) ].

	self repository commitWithMessage: 'Added another class instance variable'.

	diff := self repository headCommit diffToParent.
	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value isModification.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value definition isClassDefinition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value definition name equals: #'IceGeneratedClassForTesting class'.	
]

{ #category : 'tests-changes' }
IceSinglePackageLocalRepositoryTest >> testChangeTraitWithClassSideTraitsCompositionIsExportedInSecondCommit [

	| diff |
	"This is a Ring working copy"

	self repository workingCopy createTrait: 'T1' inPackage: self packageName1 asSymbol.

	self repository workingCopy
		createTrait: 'T2' inPackage: self packageName1 asSymbol with: [ :class | 
				| composition transformations classSideComposition classSideTransformations| 
				composition := RGTraitComposition parent: class.
				transformations := RGTraitCompositionVisitor new parse: 'T1' for: composition.
				class traitComposition: composition.
				transformations do: [ :each |
					composition addTransformation: each ].
			
				classSideComposition := RGTraitComposition parent: class classSide.
				classSideTransformations := RGTraitCompositionVisitor new 
					parse: 'T1 classTrait' for: classSideComposition.
				class classSide traitComposition: classSideComposition.
				classSideTransformations do: [ :each | 
					classSideComposition addTransformation: each ]].
		
	self repository commitWithMessage: 'First class'.

	self repository workingCopy
		createTrait: 'T2' inPackage: self packageName1 asSymbol with: [ :class | 
				| composition transformations classSideComposition classSideTransformations| 
				composition := RGTraitComposition parent: class.
				transformations := RGTraitCompositionVisitor new parse: 'T1' for: composition.
				class traitComposition: composition.
				transformations do: [ :each |
					composition addTransformation: each ].
			
				classSideComposition := RGTraitComposition parent: class classSide.
				classSideTransformations := RGTraitCompositionVisitor new 
					parse: 'T1 classTrait - {#m1}' for: classSideComposition.
				class classSide traitComposition: classSideComposition.
				classSideTransformations do: [ :each | 
					classSideComposition addTransformation: each ]].

	self repository commitWithMessage: 'Second commit'.

	diff := self repository headCommit diffToParent.
	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'T2') value isModification.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'T2') 
					value definition asMCDefinition hasClassTraitComposition.
	self 
			assert: (diff codeSubdirectoryNode / self packageName1 / 'T2') value definition asMCDefinition classTraitComposition 
			equals: '(T1 classTrait - {#m1})'.

]

{ #category : 'tests-checkout' }
IceSinglePackageLocalRepositoryTest >> testCheckoutBranchDoesNotLeaveDetachedHead [

	self repository branch checkout.
	self deny: self repository head isDetached
]

{ #category : 'tests-checkout' }
IceSinglePackageLocalRepositoryTest >> testCheckoutBranchInstallsCodeInImage [

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	
	self repository commitWithMessage: message.
	
	self repository unload.
	self denyPackageExists: self packageName1.
	
	self repository branch checkoutAllPackages.
	self assertClassExists: #IceGeneratedClassForTesting.
	self assertPackageExists: self packageName1.
]

{ #category : 'tests-checkout' }
IceSinglePackageLocalRepositoryTest >> testCheckoutBranchInstallsPackageInImage [

	self repository branch checkout.
	self assertPackageExists: self packageName1
]

{ #category : 'tests-checkout' }
IceSinglePackageLocalRepositoryTest >> testCheckoutCodeRepositoryInstallsCodeInImage [

	| message |
	message := 'Added IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: message.

	self repository unload.
	self deny: (PackageOrganizer default hasPackage: self packageName1).

	self repository head checkoutAllPackages.
	self assertClassExists: #IceGeneratedClassForTesting.
	self assertPackageExists: self packageName1
]

{ #category : 'tests-checkout' }
IceSinglePackageLocalRepositoryTest >> testCheckoutCodeRepositoryInstallsPackageInImage [

	self repository checkoutAllPackages.
	self assertPackageExists: self packageName1
]

{ #category : 'tests-checkout' }
IceSinglePackageLocalRepositoryTest >> testCheckoutCommitInstallsCodeInImage [

	| message |
	message := 'Added IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: message.

	self repository unload.
	self deny: (PackageOrganizer default hasPackage: self packageName1).

	self repository branch commit checkoutAllPackages.
	self assertClassExists: #IceGeneratedClassForTesting.
	self assertPackageExists: self packageName1
]

{ #category : 'tests-checkout' }
IceSinglePackageLocalRepositoryTest >> testCheckoutCommitInstallsPackageInImage [

	self repository branch commit checkout.
	self assertPackageExists: self packageName1.
]

{ #category : 'tests-checkout' }
IceSinglePackageLocalRepositoryTest >> testCheckoutLatestBranchCommitLeavesDetachedHead [

	self repository branch commit checkout.
	self assert: self repository head isDetached.
]

{ #category : 'tests-checkout' }
IceSinglePackageLocalRepositoryTest >> testCheckoutOlderCommitLeavesRepositoryInDetachedMode [

	| message |
	message := 'Added IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: message.
	
	message := 'Added IceAnotherClass'.
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceAnotherClass'
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: message.
	
	self repository branch newCommitWalk commits second checkout.
	self assert: self repository head isDetached
]

{ #category : 'tests-checkout' }
IceSinglePackageLocalRepositoryTest >> testCheckoutRepositoryDoesNotLeaveDetachedHead [

	self repository checkoutAllPackages.
	self deny: self repository head isDetached
]

{ #category : 'tests-commit' }
IceSinglePackageLocalRepositoryTest >> testCommitModificationsCreatesNewCommit [

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: message.
	
	self assert: self repository branch commit comment equals: message.
	self deny: self repository workingCopy isDetached.
]

{ #category : 'tests-commit' }
IceSinglePackageLocalRepositoryTest >> testCommitModificationsDoNotCreateBranch [

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: message.
	
	self assert: self repository allBranches size equals: 1.
	self deny: self repository workingCopy isDetached.
]

{ #category : 'tests-commit' }
IceSinglePackageLocalRepositoryTest >> testCommitWithDetachedHeadRaisesException [

	| message |
	self repository branch commit checkout.
	self assert: self repository head isDetached.
	
	message := 'Added IceGeneratedClassForTesting'.
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
			
	self should: [self repository commitWithMessage: message] raise: IceWorkingCopyDesyncronized.
]

{ #category : 'tests-changes' }
IceSinglePackageLocalRepositoryTest >> testCreateClassInImageMakesChangesContainClassDefinition [

	| diff |
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.

	diff := self repository workingCopyDiff.
	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 2 "Class and Metaclass".
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting') value definition isClassDefinition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting') value definition name equals: #IceGeneratedClassForTesting.
]

{ #category : 'tests-changes' }
IceSinglePackageLocalRepositoryTest >> testCreateClassInImageMakesChangesNonEmpty [

	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self deny: self repository workingCopyDiff isEmpty
]

{ #category : 'tests-changes' }
IceSinglePackageLocalRepositoryTest >> testCreateClassInImageMakesRespositoryModifications [

	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self assert: self repository isModified
]

{ #category : 'tests-changes' }
IceSinglePackageLocalRepositoryTest >> testCreateClassWithClassInstanceVariableInImageMakesChangesContainClassAndMetaclassDefinition [

	| diff |
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol
		with: [ :class | class metaclass instanceVariables: #(someClassInstVar) ].

	diff := self repository workingCopyDiff.
	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 2 "Class and Metaclass".
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting') value definition isClassDefinition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting') value definition name equals: #IceGeneratedClassForTesting.
]

{ #category : 'tests-changes' }
IceSinglePackageLocalRepositoryTest >> testCreateExtensionMethodMakesExtensionMethodAsAddition [

	| diff |
	"This is a Ring working copy"
	self repository workingCopy environment ensureClassNamed: #ToBeExtended.
	self repository workingCopy
		createMethod: 'method ^ 42'
		extendingClass: #ToBeExtended
		inPackage: self packageName1 asSymbol.

	diff := self repository workingCopyDiff.
	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'ToBeExtended') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'ToBeExtended') value definition isExtensionDefinition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'ToBeExtended' / 'method') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'ToBeExtended' / 'method') value definition isMethodDefinition.
]

{ #category : 'tests-queries' }
IceSinglePackageLocalRepositoryTest >> testCurrentBranchIsDefaultMasterBranch [

	self assert: self repository branch name equals: 'master'
]

{ #category : 'tests-commit' }
IceSinglePackageLocalRepositoryTest >> testDetachedHeadCannotCommit [

	self repository branch commit checkout.
	self assert: self repository head isDetached.
	self should: [self repository validateCanCommit] raise: IceWorkingCopyDesyncronized.
]

{ #category : 'tests-queries' }
IceSinglePackageLocalRepositoryTest >> testListBranchCommitsListsCommitsInBranch [

	| branches commits |
	branches := self repository allBranches.
	commits := branches first commits.

	self assert: commits size equals: self expectedCommitsInNewBranch.
	self assert: commits first comment equals: 'Initial commit'.
]

{ #category : 'tests-queries' }
IceSinglePackageLocalRepositoryTest >> testListPackagesListExistingPackage [

	| packages |
	packages := self repository workingCopy packageNames.
	self assert: packages size equals: 1.
	self assert: packages first equals: self packageName1
]

{ #category : 'tests-changes' }
IceSinglePackageLocalRepositoryTest >> testNoChangesInImageMakesChangesEmpty [

	self assert: self repository workingCopyDiff isEmpty
]

{ #category : 'tests-changes' }
IceSinglePackageLocalRepositoryTest >> testNoChangesInImageMakesNoModifications [

	self deny: self repository isModified
]

{ #category : 'tests-changes' }
IceSinglePackageLocalRepositoryTest >> testRemoveClassInstanceVariableIsExportedInCommit [

	| diff |
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: 'First class'.

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol
		with: [ :class | class metaclass instanceVariables: #(someClassInstVar) ].

	self repository commitWithMessage: 'Added class instance variable'.	

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol
		with: [ :class | class metaclass instanceVariables: #() ].

	self repository commitWithMessage: 'Remove class instance variable'.
	
	diff := self repository headCommit diffToParent.
	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value isModification.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value definition isClassDefinition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value definition name equals: #'IceGeneratedClassForTesting class'.
]

{ #category : 'tests-changes' }
IceSinglePackageLocalRepositoryTest >> testRemoveClassWithClassMethodIsExportedInCommit [

	| diff |
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self repository workingCopy
		createMethod: 'foo' inClass: 'IceGeneratedClassForTesting class'.

	self repository commitWithMessage: 'First class'.

	self repository workingCopy removeClassNamed: 'IceGeneratedClassForTesting'.
	
	self repository commitWithMessage: 'Remove class'.
	
	diff := self repository headCommit diffToParent.
	self assert: diff codeSubdirectoryNode children size equals: 1.
	
	"2 children removed, class side and instance side"
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 2.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting') value isRemoval.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class' / 'foo') value definition isMethodDefinition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class' / 'foo') value isRemoval.
]

{ #category : 'tests-changes' }
IceSinglePackageLocalRepositoryTest >> testRemoveExtensionMethodDoesNotRemoveExtendedClass [

	| commitWithExtension commitWithoutExtension |
	"This is a Ring working copy"
	self repository workingCopy environment ensureClassNamed: #ToBeExtended.
	self repository workingCopy
		createMethod: 'method ^ 42'
		extendingClass: #ToBeExtended
		inPackage: self packageName1 asSymbol.
	
	commitWithExtension := self repository commitWithMessage: 'Added extension method'.
		
	"Remove extension method without modifying working copy packages."
	self repository workingCopy
		removeMethod: #method
		extendingClass: #ToBeExtended
		fromPackage: self packageName1 asSymbol.

	commitWithoutExtension := self repository commitWithMessage: 'Added extension method'.
	
	"Go to the commit with the extension and come back to the one without."
	commitWithExtension checkout.
	commitWithoutExtension checkout.
	
	self assertClassExists: #ToBeExtended
]

{ #category : 'tests-changes' }
IceSinglePackageLocalRepositoryTest >> testRemoveExtensionMethodMakesExtensionRemoval [

	| diff |
	"This is a Ring working copy"
	self repository workingCopy environment ensureClassNamed: #ToBeExtended.
	self repository workingCopy
		createMethod: 'method ^ 42'
		extendingClass: #ToBeExtended
		inPackage: self packageName1 asSymbol.
	
	self repository commitWithMessage: 'Added extension method'.
		
	"Remove extension method without modifying working copy packages."
	self repository workingCopy
		removeMethod: #method
		extendingClass: #ToBeExtended
		fromPackage: self packageName1 asSymbol.

	diff := self repository workingCopyDiff.
	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'ToBeExtended') value isRemoval.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'ToBeExtended') value definition isExtensionDefinition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'ToBeExtended' / 'method') value isRemoval.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'ToBeExtended' / 'method') value definition isMethodDefinition.
]

{ #category : 'tests-checkout' }
IceSinglePackageLocalRepositoryTest >> testRemovePackageRemovesIt [

	| package |
	package := self repository workingCopy packageNamed: self packageName1.
	package remove.
	
	self assert: (self repository workingCopyDiff codeSubdirectoryNode / self packageName1) value isRemoval
]

{ #category : 'tests-revert' }
IceSinglePackageLocalRepositoryTest >> testRevertAllRevertsClassAddition [

	| className |
	className := 'IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	self repository workingCopy
		createClass: className
		inPackage: self packageName1 asSymbol.

	self assertClassExists: className.
	self workingCopy discardChanges.
	self denyClassExists: className.
]

{ #category : 'tests-revert' }
IceSinglePackageLocalRepositoryTest >> testRevertAllRevertsClassRemoval [

	| className |
	className := 'IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	self repository workingCopy
		createClass: className
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: 'Added class'.

	self repository workingCopy
		removeClassNamed: className.

	self denyClassExists: className.
	self workingCopy discardChanges.
	self assertClassExists: className.
]

{ #category : 'tests-revert' }
IceSinglePackageLocalRepositoryTest >> testRevertAllRevertsClassSlotModification [

	| className class |
	className := 'IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	self repository workingCopy
		createClass: className
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: 'Added class'.

	class := self repository workingCopy
		environment ask behaviorNamed: className.
	class instanceVariables: #( slot ).
	(self repository workingCopy packageNamed: class package name)
		beDirty.

	self assert: ((self repository workingCopy
		environment ask behaviorNamed: className) instVarNames includes: #slot).
	self workingCopy discardChanges.
	self deny: ((self repository workingCopy
		environment ask behaviorNamed: className) instVarNames includes: #slot).
]

{ #category : 'tests-revert' }
IceSinglePackageLocalRepositoryTest >> testRevertAllRevertsMethodAddition [

	| className |
	className := 'IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	self repository workingCopy
		createClass: className
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: 'Added class'.

	self repository workingCopy
		createMethod: 'method' inClass: className.

	self assertMethodExists: 'method' inClass: className.
	self workingCopy discardChanges.
	self denyMethodExists: 'method' inClass: className.
]

{ #category : 'tests-revert' }
IceSinglePackageLocalRepositoryTest >> testRevertAllRevertsMethodModification [

	| className |
	className := 'IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	self repository workingCopy
		createClass: className
		inPackage: self packageName1 asSymbol.

	self repository workingCopy
		createMethod: 'method' inClass: className.

	self repository commitWithMessage: 'Added class'.

	self repository workingCopy
		createMethod: 'method ^ 42' inClass: className.

	self assertMethodExists: 'method' inClass: className.
	self
		assert: ((self repository workingCopy environment ask behaviorNamed: className) methodNamed: 'method') sourceCode
		equals: 'method ^ 42'.
	self workingCopy discardChanges.
	self assertMethodExists: 'method' inClass: className.
	self
		assert: ((self repository workingCopy environment ask behaviorNamed: className) methodNamed: 'method') sourceCode
		equals: 'method'
]

{ #category : 'tests-revert' }
IceSinglePackageLocalRepositoryTest >> testRevertAllRevertsMethodRemoval [

	| className |
	className := 'IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	self repository workingCopy
		createClass: className
		inPackage: self packageName1 asSymbol.

	self repository workingCopy
		createMethod: 'method' inClass: className.

	self repository commitWithMessage: 'Added class'.

	self repository workingCopy
		removeMethod: 'method' fromClass: className.

	self denyMethodExists: 'method' inClass: className.
	self workingCopy discardChanges.
	self assertMethodExists: 'method' inClass: className.
]

{ #category : 'tests-revert' }
IceSinglePackageLocalRepositoryTest >> testRevertSingleDefinitionRevertsClassAddition [

	| className |
	className := 'IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	self repository workingCopy
		createClass: className
		inPackage: self packageName1 asSymbol.

	self assertClassExists: className.
	self workingCopy discardChanges: (self repository workingCopyDiff codeSubdirectoryNode / self packageName1 / className).
	self denyClassExists: className.
]

{ #category : 'tests-revert' }
IceSinglePackageLocalRepositoryTest >> testRevertSingleDefinitionRevertsClassRemoval [

	| className |
	className := 'IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	self repository workingCopy
		createClass: className
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: 'Added class'.

	self repository workingCopy
		removeClassNamed: className.

	self denyClassExists: className.
	self workingCopy discardChanges: (self repository workingCopyDiff codeSubdirectoryNode / self packageName1 / className).
	self assertClassExists: className.
]

{ #category : 'tests-revert' }
IceSinglePackageLocalRepositoryTest >> testRevertSingleDefinitionRevertsClassSlotModification [

	| className class |
	className := 'IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	self repository workingCopy
		createClass: className
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: 'Added class'.

	class := self repository workingCopy
		environment ask behaviorNamed: className.
	class instanceVariables: #( slot ).
	(self repository workingCopy packageNamed: class package name)
		beDirty.

	self assert: ((self repository workingCopy
		environment ask behaviorNamed: className) instVarNames includes: #slot).
	self workingCopy discardChanges: (self repository workingCopyDiff codeSubdirectoryNode / self packageName1 / className).
	self deny: ((self repository workingCopy
		environment ask behaviorNamed: className) instVarNames includes: #slot).
]

{ #category : 'tests-revert' }
IceSinglePackageLocalRepositoryTest >> testRevertSingleDefinitionRevertsMethodAddition [

	| className |
	className := 'IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	self repository workingCopy
		createClass: className
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: 'Added class'.

	self repository workingCopy
		createMethod: 'method' inClass: className.

	self assertMethodExists: 'method' inClass: className.
	self workingCopy discardChanges: (self repository workingCopyDiff codeSubdirectoryNode / self packageName1 / className / 'method').
	self denyMethodExists: 'method' inClass: className.
]

{ #category : 'tests-revert' }
IceSinglePackageLocalRepositoryTest >> testRevertSingleDefinitionRevertsMethodModification [

	| className |
	className := 'IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	self repository workingCopy
		createClass: className
		inPackage: self packageName1 asSymbol.

	self repository workingCopy
		createMethod: 'method' inClass: className.

	self repository commitWithMessage: 'Added class'.

	self repository workingCopy
		createMethod: 'method ^ 42' inClass: className.

	self assertMethodExists: 'method' inClass: className.
	self
		assert: ((self repository workingCopy environment ask behaviorNamed: className) methodNamed: 'method') sourceCode
		equals: 'method ^ 42'.
	self workingCopy discardChanges: (self repository workingCopyDiff codeSubdirectoryNode / self packageName1 / className / 'method').
	self assertMethodExists: 'method' inClass: className.
	self
		assert: ((self repository workingCopy environment ask behaviorNamed: className) methodNamed: 'method') sourceCode
		equals: 'method'
]

{ #category : 'tests-revert' }
IceSinglePackageLocalRepositoryTest >> testRevertSingleDefinitionRevertsMethodRemoval [

	| className |
	className := 'IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	self repository workingCopy
		createClass: className
		inPackage: self packageName1 asSymbol.

	self repository workingCopy
		createMethod: 'method' inClass: className.

	self repository commitWithMessage: 'Added class'.

	self repository workingCopy
		removeMethod: 'method' fromClass: className.

	self denyMethodExists: 'method' inClass: className.
	self workingCopy discardChanges: (self repository workingCopyDiff codeSubdirectoryNode / self packageName1 / className / 'method').
	self assertMethodExists: 'method' inClass: className.
]

{ #category : 'tests-checkout' }
IceSinglePackageLocalRepositoryTest >> testUnloadDoesNotRemovePackage [

	| package |
	package := self repository workingCopy packageNamed: self packageName1.
	package unload.
	
	self assert: self repository workingCopyDiff isEmpty
]
