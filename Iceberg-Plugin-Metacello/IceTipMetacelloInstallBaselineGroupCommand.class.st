"
I'm a command to install a baseline (choose the group(s) to install)
"
Class {
	#name : 'IceTipMetacelloInstallBaselineGroupCommand',
	#superclass : 'IceTipMetacelloInstallBaselineCommand',
	#category : 'Iceberg-Plugin-Metacello',
	#package : 'Iceberg-Plugin-Metacello'
}

{ #category : 'accessing - defaults' }
IceTipMetacelloInstallBaselineGroupCommand class >> defaultName [

	^ 'Install baseline...'
]

{ #category : 'executing' }
IceTipMetacelloInstallBaselineGroupCommand >> execute [

	| result |
	result := self application newRequest
		          title: 'Enter groups to install';
		          label: 'Groups to install (a comma separated string)';
		          text: 'All'; openModal.
	 result ifNil: [ ^ self ].

	self
		installBaseline: self package
		groups:
		((result substrings: ',')
			 collect: [ :each | each trimmed ]
			 as: Array)
]
