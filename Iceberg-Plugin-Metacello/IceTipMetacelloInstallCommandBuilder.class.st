Class {
	#name : 'IceTipMetacelloInstallCommandBuilder',
	#superclass : 'Object',
	#category : 'Iceberg-Plugin-Metacello',
	#package : 'Iceberg-Plugin-Metacello'
}

{ #category : 'builder' }
IceTipMetacelloInstallCommandBuilder >> addCommandsFor: anIceTipRepositoryModel intoGroup: aSpCommandGroup context: context [
	
	| baselines |
	
	baselines := (anIceTipRepositoryModel workingCopyModel packageModels 
		select: [ :each | each name beginsWith: 'BaselineOf' ])
		sorted: [ :a :b | a name < b name ].
		
	
	baselines do: [ :aPackage |
		self addCommandsForPackage: aPackage intoGroup: aSpCommandGroup context: context ]
]

{ #category : 'builder' }
IceTipMetacelloInstallCommandBuilder >> addCommandsForPackage: aPackage intoGroup: commandGroup context: context [
	| defaultBaselineCommand groupBaselineCommand baselineName |
	
	baselineName := aPackage name allButFirst: 'BaselineOf' size.
	
	defaultBaselineCommand := IceTipMetacelloInstallBaselineDefaultCommand new.
	defaultBaselineCommand name: ('Install baseline of {1} (Default)' format: { baselineName }).
	defaultBaselineCommand packageModel: aPackage.
	defaultBaselineCommand context: context.
	commandGroup register: defaultBaselineCommand asSpecCommand.
	
	groupBaselineCommand := IceTipMetacelloInstallBaselineGroupCommand new.
	groupBaselineCommand name: ('Install baseline of {1} ...' format: { baselineName }).
	groupBaselineCommand packageModel: aPackage.
	groupBaselineCommand context: context.
	commandGroup register: groupBaselineCommand asSpecCommand.
	
	commandGroup register: (IceTipMetacelloToggleLockCommand new 
		packageModel: aPackage;
		context: context;
		asSpecCommand)
]
