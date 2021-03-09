Class {
	#name : #IceTipMetacelloInstallCommandBuilder,
	#superclass : #Object,
	#category : #'Iceberg-Plugin-Metacello'
}

{ #category : #builder }
IceTipMetacelloInstallCommandBuilder >> addCommandsFor: anIceTipRepositoryModel intoGroup: aSpCommandGroup [ 
	
	| baselines |
	
	baselines := (anIceTipRepositoryModel workingCopy packageModels 
		select: [ :each | each name beginsWith: 'BaselineOf' ])
		sorted: [ :a :b | a name < b name ].
		
	
	baselines do: [ :aPackage |
		self addCommandsForPackage: aPackage intoGroup: aSpCommandGroup ]
]

{ #category : #builder }
IceTipMetacelloInstallCommandBuilder >> addCommandsForPackage: aPackage intoGroup: aSpCommandGroup [ 
	
	| defaultBaselineCommand groupBaselineCommand baselineName |
	
	baselineName := aPackage name allButFirst: 'BaselineOf' size.
	
	defaultBaselineCommand := IceTipMetacelloInstallBaselineDefaultCommand new.
	defaultBaselineCommand name: ('Install baseline of {1} (Default)' format: { baselineName }).
	defaultBaselineCommand packageModel: aPackage.
	aSpCommandGroup register: defaultBaselineCommand asSpecCommand.
	
	groupBaselineCommand := IceTipMetacelloInstallBaselineGroupCommand new.
	groupBaselineCommand name: ('Install baseline of {1} ...' format: { baselineName }).
	groupBaselineCommand packageModel: aPackage.
	aSpCommandGroup register: groupBaselineCommand asSpecCommand
]
