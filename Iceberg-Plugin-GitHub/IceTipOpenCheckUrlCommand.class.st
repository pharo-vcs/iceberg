Class {
	#name : #IceTipOpenCheckUrlCommand,
	#superclass : #CmCommand,
	#instVars : [
		'credentials',
		'remote',
		'retries'
	],
	#category : #'Iceberg-Plugin-GitHub-Commands'
}

{ #category : #executing }
IceTipOpenCheckUrlCommand >> execute [
	"Execute the actions that should be done by the command.
	 This method expect that the context has been put in #context inst. var. if any context is relevant."

	| url |

	url := self context checksTable selection selectedItem at: 'target_url'.
	self class environment
		at: #WebBrowser
		ifPresent: [ :webBrowser | webBrowser openOn: url ]
		ifAbsent: [ self
				inform:
					('Cannot open "{1}" because the project WebBrowser is not present by default in Pharo 6.'
						format: {url}) ]
]

{ #category : #initialization }
IceTipOpenCheckUrlCommand >> initialize [
    super initialize.
    self
        basicName: 'Open url';
        basicDescription: 'Open a internet browser to look for the url of the check'
]
