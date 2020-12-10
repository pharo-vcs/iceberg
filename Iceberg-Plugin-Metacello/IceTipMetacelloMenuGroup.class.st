"
I'm the common group for metacello extensions.
"
Class {
	#name : #IceTipMetacelloMenuGroup,
	#superclass : #CmCommandGroup,
	#category : #'Iceberg-Plugin-Metacello'
}

{ #category : #convenience }
IceTipMetacelloMenuGroup class >> commandsThatCanBeExecutedIn: aContext [

	^ {  IceTipMetacelloInstallBaselineDefaultCommand.
		 IceTipMetacelloInstallBaselineGroupCommand }
			 collect: [ :each | each forSpecContext: aContext ]
			 thenSelect: [ :each | each canBeExecuted ]
]

{ #category : #accessing }
IceTipMetacelloMenuGroup class >> defaultDescription [

	^ 'Metacello install operations'
]

{ #category : #accessing }
IceTipMetacelloMenuGroup class >> defaultName [

	^ 'Metacello'
]

{ #category : #convenience }
IceTipMetacelloMenuGroup class >> registerIfNotEmptyOn: aSpCommandGroup context: aContext [

	(self commandsThatCanBeExecutedIn: aContext) ifNotEmpty: [ :commands | 
		| newGroup |
		newGroup := self new asSpecGroup.
		commands do: [ :each | newGroup register: each ].
		aSpCommandGroup register: newGroup ]
]
