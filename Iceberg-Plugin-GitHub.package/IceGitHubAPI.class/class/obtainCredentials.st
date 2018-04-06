private
obtainCredentials
	| provider |
	
	"I try to get the configured credentials, if there is no, I will not attempt to get some.
	Use #ensureCredentials when really need to login."
	
	provider := IceGitHubCredentialsProvider new.
	provider credentials isPresent ifFalse: [^ nil ].
	^ provider credentials.
