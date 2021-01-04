"
Command used in the version browser, inside the code browser.
This command takes the selected version and installs it (also called revert).
"
Class {
	#name : #IceTipInstallVersionCommand,
	#superclass : #IceTipCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipInstallVersionCommand class >> defaultDescription [

	^ 'Revert to the selected version'
]

{ #category : #accessing }
IceTipInstallVersionCommand class >> defaultName [

	^ 'Install this version'
]

{ #category : #execution }
IceTipInstallVersionCommand >> execute [
	
	self version install
]

{ #category : #activation }
IceTipInstallVersionCommand >> iconName [

	^ #smallRedo
]

{ #category : #execution }
IceTipInstallVersionCommand >> version [

	^ self context version
]
