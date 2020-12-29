Extension { #name : #IceTipWorkingCopyBrowser }

{ #category : #'*Iceberg-Plugin-Metacello' }
IceTipWorkingCopyBrowser class >> metacelloCommandsWith: presenter forRootGroup: aCommandGroup [

	<extensionCommands>
	| newGroup |
	newGroup := CmCommandGroup forSpec
		name: 'Metacello';
		description: 'Metacello install operations';
		yourself.

	{  IceTipMetacelloInstallBaselineDefaultCommand.
		IceTipMetacelloInstallBaselineGroupCommand }
			do: [ :each | newGroup register: each forSpec ].

	(aCommandGroup / self selectionCommandGroupName)
		register: newGroup. 

]
