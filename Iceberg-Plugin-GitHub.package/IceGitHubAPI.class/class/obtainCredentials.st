private
obtainCredentials
	| provider |
	
	"I try to get the configured credentials, if there is no, I will not attempt to get some.
	Use #ensureCredentials when really need to login."
	
	provider := IceCredentialsProvider defaultForHost: 'github.com'.
	provider plaintextCredentials isPresent ifFalse: [^ nil ].
	^ provider plaintextCredentials.
