settings
settingsAddButtonAction
	| hostname |
	
	hostname := UIManager default request: 'Enter Host name for the credential' initialAnswer: '' title: 'New Credentials'.
	hostname ifEmpty: [ ^ self ].
	
	self addEmptyCredentialsForHost: hostname.
	
	SettingBrowser refreshAllSettingBrowsersRecreatingNodes.