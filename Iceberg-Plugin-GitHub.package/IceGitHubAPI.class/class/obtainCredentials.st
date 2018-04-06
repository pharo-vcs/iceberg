private
obtainCredentials
	| newCredentials provider |
	
	"I try to get the configured credentials, if there is no, I will not attempt to get some.
	Use #ensureCredentials when really need to login."
	
	provider := IceCredentialsProvider default.
	provider plaintextCredentials isPresent ifFalse: [^ nil ].
	newCredentials := IcePlaintextCredentials new.
	provider provideConfiguredPlaintextCredentialsTo: newCredentials.
	^ newCredentials
