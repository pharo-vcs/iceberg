"
Command used in the version browser, inside the code browser.
This command takes the selected version and installs it (also called revert).
"
Class {
	#name : 'IceTipInstallVersionCommand',
	#superclass : 'IceTipCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipInstallVersionCommand class >> defaultDescription [

	^ 'Revert to the selected version'
]

{ #category : 'accessing - defaults' }
IceTipInstallVersionCommand class >> defaultName [

	^ 'Install this version'
]

{ #category : 'executing' }
IceTipInstallVersionCommand >> execute [

	self version newInstallAction executeWithContext: self context
]

{ #category : 'activation' }
IceTipInstallVersionCommand >> iconName [

	^ #smallRedo
]

{ #category : 'execution' }
IceTipInstallVersionCommand >> version [

	^ self context selectedItem
]
