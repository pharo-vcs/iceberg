Extension { #name : 'IceTipRepositoriesBrowser' }

{ #category : '*Iceberg-Plugin-Metacello' }
IceTipRepositoriesBrowser class >> metacelloCommandsWith: presenter forRootGroup: aCommandGroup [
	<extensionCommands>
	| newGroup |

	newGroup := SpDynamicActionGroup new
		name: 'Metacello';
		description: 'Metacello install operations';
		with: [ :aGroup |
			presenter selectedItem ifNotNil: [ 
				IceTipMetacelloInstallCommandBuilder new
					addCommandsFor: presenter selectedItem 
					intoGroup: aGroup 
					context: presenter ] ];
		yourself.
	
	(aCommandGroup commandOrGroupNamed: 'Selection') register: newGroup
]
