Extension { #name : 'IceTipWorkingCopyBrowser' }

{ #category : '*Iceberg-Plugin-Metacello' }
IceTipWorkingCopyBrowser class >> metacelloCommandsWith: presenter forRootGroup: aCommandGroup [
	<extensionCommands>
	| newGroup |
	
	newGroup := CmCommandGroup forSpec
		name: 'Metacello';
		description: 'Metacello install operations';
		yourself.

	{  
		IceTipMetacelloInstallBaselineDefaultCommand.
		IceTipMetacelloInstallBaselineGroupCommand.
		IceTipMetacelloToggleLockCommand 
	} do: [ :each | newGroup register: (each forSpecContext: presenter) ].

	(aCommandGroup / self selectionCommandGroupName)
		register: newGroup. 

]

{ #category : '*Iceberg-Plugin-Metacello' }
IceTipWorkingCopyBrowser class >> metacelloDecorators [
	<extensionDecorators>
	
	^ { 
	IceTipMetacelloBaselineDecorator new.  
	}
]
