Class {
	#name : 'IceTipCommitSettings',
	#superclass : 'Object',
	#classInstVars : [
		'pushOnCommit',
		'saveImageOnCommit',
		'critiquesOnCommit'
	],
	#category : 'Iceberg-Settings',
	#package : 'Iceberg',
	#tag : 'Settings'
}

{ #category : 'accessing' }
IceTipCommitSettings class >> critiquesOnCommit [

	^ critiquesOnCommit ifNil: [ 
		  critiquesOnCommit := self critiquesOnCommitDefaultValue ]
]

{ #category : 'accessing' }
IceTipCommitSettings class >> critiquesOnCommit: aBoolean [
	critiquesOnCommit := aBoolean 
]

{ #category : 'accessing' }
IceTipCommitSettings class >> critiquesOnCommitDefaultValue [

	^ true
]

{ #category : 'accessing' }
IceTipCommitSettings class >> pushOnCommit [

	^ pushOnCommit ifNil: [ 
		  pushOnCommit := self pushOnCommitDefaultValue ]
]

{ #category : 'accessing' }
IceTipCommitSettings class >> pushOnCommit: aBoolean [
	pushOnCommit := aBoolean 
]

{ #category : 'accessing' }
IceTipCommitSettings class >> pushOnCommitDefaultValue [

	^ false
]

{ #category : 'accessing' }
IceTipCommitSettings class >> saveImageOnCommit [

	^ saveImageOnCommit ifNil: [ 
		  saveImageOnCommit := self saveImageOnCommitDefaultValue ]
]

{ #category : 'accessing' }
IceTipCommitSettings class >> saveImageOnCommit: aBoolean [
	saveImageOnCommit := aBoolean 
]

{ #category : 'accessing' }
IceTipCommitSettings class >> saveImageOnCommitDefaultValue [

	^ true
]

{ #category : 'settings' }
IceTipCommitSettings class >> settingsOn: aBuilder [

	<systemsettings>
	(aBuilder group: #commitPreferences)
		parent: #Iceberg;
		noOrdering;
		target: self;
		label: 'Commit action settings';
		description: 'Chose the behavior when you commit something';
		with: [
			(aBuilder setting: #critiquesOnCommit)
				noOrdering;
				target: self;
				default: self critiquesOnCommitDefaultValue;
				label: 'Run Code Critiques when committing';
				description:
					'Check if you want to run the code critiques on the changes each time you commit them'.
			(aBuilder setting: #saveImageOnCommit)
				noOrdering;
				target: self;
				default: self saveImageOnCommitDefaultValue;
				label: 'Save the image when committing';
				description:
					'Check if you want to save the image each time you commit something'.
			(aBuilder setting: #pushOnCommit)
				noOrdering;
				target: self;
				default: self pushOnCommitDefaultValue;
				label: 'Push when committing';
				description:
					'Check if you want to push your changes each time you commit something' ]
]
