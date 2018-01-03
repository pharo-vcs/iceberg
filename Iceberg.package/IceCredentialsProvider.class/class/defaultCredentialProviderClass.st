private
defaultCredentialProviderClass
	| providers  |
	providers := self allSubclasses.
	providers size = 1 ifTrue: [ ^ providers anyOne ].
	^ providers detect: #isDefault