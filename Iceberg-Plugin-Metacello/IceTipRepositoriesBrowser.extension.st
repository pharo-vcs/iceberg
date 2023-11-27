Extension { #name : 'IceTipRepositoriesBrowser' }

{ #category : '*Iceberg-Plugin-Metacello' }
IceTipRepositoriesBrowser class >> metacelloCommandsWith: presenter forRootGroup: aCommandGroup [

	<extensionCommands>
	| newGroup |
	newGroup := CmCommandGroup forSpec
		name: 'Metacello';
		description: 'Metacello install operations';
		yourself.
	
	(aCommandGroup commandOrGroupNamed: 'Selection') register: newGroup.

	presenter selectedItem ifNotNil: [ 
		IceTipMetacelloInstallCommandBuilder new
			addCommandsFor: presenter selectedItem intoGroup: newGroup context: presenter ]	

]
