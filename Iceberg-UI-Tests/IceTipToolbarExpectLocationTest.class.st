Class {
	#name : #IceTipToolbarExpectLocationTest,
	#superclass : #TestCase,
	#category : 'Iceberg-UI-Tests'
}

{ #category : #tests }
IceTipToolbarExpectLocationTest >> expecteLeftCommandClasses [

	^ { 
		IceTipFetchAllProjectCommand.
		IceTipCommitCommand.
		IceTipPushCommand.
		IceTipPullCommand.
		IceTipFetchCommand.
		IceTipCheckoutBranchCommand.
		IceTipMergeCommand
	 }
]

{ #category : #tests }
IceTipToolbarExpectLocationTest >> expecteRightCommandClasses [

	^ { 
		IceTipAddRepositoryCommand.
		IceTipAddPackageCommand.
		IceTipDiscardChangesCommand.
		IceTipManageRepositoryCommand
	 }
]

{ #category : #tests }
IceTipToolbarExpectLocationTest >> testExpectedLocationOfLeftToolbarButtons [

	self assert: (self expecteLeftCommandClasses allSatisfy: [ :class | class defaultPosition = #left ])
]

{ #category : #tests }
IceTipToolbarExpectLocationTest >> testExpectedLocationOfRightToolbarButtons [

	self assert: (self expecteRightCommandClasses allSatisfy: [ :class | class defaultPosition = #right ])
]
