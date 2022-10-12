"
I'm a general command to install metacello baselines.
"
Class {
	#name : #IceTipMetacelloInstallBaselineCommand,
	#superclass : #IceTipPackageCommand,
	#category : #'Iceberg-Plugin-Metacello'
}

{ #category : #testing }
IceTipMetacelloInstallBaselineCommand class >> isAbstract [

	^ self == IceTipMetacelloInstallBaselineCommand
]

{ #category : #private }
IceTipMetacelloInstallBaselineCommand >> basicInstallBaseline: icePackage groups: anArray [

	| packageDir sourceDirectory |
	sourceDirectory := icePackage repository project sourceDirectory.
	sourceDirectory ifEmpty: [ sourceDirectory := '.'].

	packageDir := (icePackage repository location / sourceDirectory) fullName.

	Metacello new
		repository: 'gitlocal://', packageDir;
		baseline: icePackage metacelloBaselineName;
		onUpgrade: [ :e | | policy |
			policy := self chooseUpgradePolicyFor: e.
			policy ifNotNil: [ e perform: policy ] ];
		onConflict: [ :e | | policy |
			policy := self chooseConflictPolicyFor: e.
			policy ifNotNil: [ e perform: policy ] ];
		load: anArray
]

{ #category : #testing }
IceTipMetacelloInstallBaselineCommand >> canBeExecuted [

	^ self packageModel notNil and: [ self package isMetacelloBaseline ]
]

{ #category : #private }
IceTipMetacelloInstallBaselineCommand >> chooseConflictPolicyFor: aMetacelloUpgradeRequest [

	| projectName optionA optionB sessionContext |
	sessionContext := IceMetacelloLoadSessionContext value.
	projectName := aMetacelloUpgradeRequest projectName.
	optionA := aMetacelloUpgradeRequest newProjectRegistration printString.
	optionB := aMetacelloUpgradeRequest existingProjectRegistration printString.
	
	^ sessionContext 
		recordChoiceProject: projectName 
		optionA: optionA 
		optionB: optionB
		ifAbsentAnswer: [ 	
			self 
				chooseConflictPolicyProject: projectName 
				optionA: optionA 
				optionB: optionB ]
]

{ #category : #private }
IceTipMetacelloInstallBaselineCommand >> chooseConflictPolicyProject: projectName optionA: optionA optionB: optionB [

	^ UIManager default 
		chooseFrom: {
			'Use INCOMING version {1}' format: { optionA }. 
			'Use LOADED version {1}' format: { optionB } }
		values: { 
			#useIncoming. 
			#useLoaded }
		message: ('There are conflicting versions of project "{1}".' format: { projectName })
		title: 'Conflicting project versions'
]

{ #category : #private }
IceTipMetacelloInstallBaselineCommand >> chooseUpgradePolicyFor: aMetacelloUpgradeRequest [
	| projectName optionA optionB sessionContext |

	sessionContext := IceMetacelloLoadSessionContext value.
	projectName := aMetacelloUpgradeRequest projectName.
	optionA := aMetacelloUpgradeRequest newProjectRegistration printString.
	optionB := aMetacelloUpgradeRequest existingProjectRegistration printString.
	
	^ sessionContext 
		recordChoiceProject: projectName 
		optionA: optionA 
		optionB: optionB
		ifAbsentAnswer: [ 				
			self 
				chooseUpgradePolicyProject: projectName 
				optionA: optionA 
				optionB: optionB ]
]

{ #category : #private }
IceTipMetacelloInstallBaselineCommand >> chooseUpgradePolicyProject: projectName optionA: optionA optionB: optionB [

	^ UIManager default 
		chooseFrom: {
			'Use INCOMING version {1}' format: { optionA }. 
			'Use LOADED version {1}' format: { optionB } }
		values: { 
			#useIncoming. 
			#useLoaded }
		message: ('There is already a project "{1}" in this installation.' format: { projectName })
		title: 'Duplicated project!'
]

{ #category : #executing }
IceTipMetacelloInstallBaselineCommand >> iconName [

	^ #smallLoadProject
]

{ #category : #private }
IceTipMetacelloInstallBaselineCommand >> installBaseline: icePackage [ 

	^ self installBaseline: icePackage groups: #()
]

{ #category : #private }
IceTipMetacelloInstallBaselineCommand >> installBaseline: icePackage groups: anArray [

	IceTipStandardAction new
		repository: self repository;
		message: ('Installing baseline {1} of {2}' format: { 
			icePackage metacelloBaselineName.
			self repositoryModel name });
		onSuccessRepositoryModified;
		action: [ 
			Iceberg announcer 
				suspendAllForRepository: self repository
				while: [ self basicInstallBaseline: icePackage groups: anArray ] ];
		executeWithContext: self context
]
