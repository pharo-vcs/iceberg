"
I'm a command to install a baseline (choose the group(s) to install)
"
Class {
	#name : #IceTipMetacelloInstallBaselineGroupCommand,
	#superclass : #IceTipMetacelloInstallBaselineCommand,
	#category : #'Iceberg-Plugin-Metacello'
}

{ #category : #accessing }
IceTipMetacelloInstallBaselineGroupCommand class >> defaultName [

	^ 'Install baseline...'
]

{ #category : #execution }
IceTipMetacelloInstallBaselineGroupCommand >> execute [

	| result |
	result := UIManager default 
		request: 'Groups to install (a comma separated string)' 
		initialAnswer: '' 
		title: 'Enter groups to install'.
	result ifNil: [ ^ self ].
	
	self 
		installBaseline: self package
		groups: ((result substrings: ',') 
			collect: #trimmed 
			as: Array)
]
