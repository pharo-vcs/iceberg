"
I'm a command to open in the native web browser the detail of a GitHub Pull Request check.

"
Class {
	#name : 'IceTipOpenCheckUrlCommand',
	#superclass : 'IceTipCommand',
	#category : 'Iceberg-Plugin-GitHub-View',
	#package : 'Iceberg-Plugin-GitHub',
	#tag : 'View'
}

{ #category : 'accessing - defaults' }
IceTipOpenCheckUrlCommand class >> defaultDescription [

	^ 'Open a internet browser to look for the url of the check'
]

{ #category : 'accessing - defaults' }
IceTipOpenCheckUrlCommand class >> defaultName [

	^ 'Open url'
]

{ #category : 'executing' }
IceTipOpenCheckUrlCommand >> execute [
	"Execute the actions that should be done by the command. 
	This method expect that the context has been put in #context inst.var. if any context is relevant."

	WebBrowser openOn: self targetUrl

]

{ #category : 'accessing' }
IceTipOpenCheckUrlCommand >> targetUrl [

	^ self context checksTable selection selectedItem at: 'target_url'

]
