tests
testDeprecatedAPI
	self
		should: [ IceCredentialsProvider
				plaintextCredentials:
					(IcePlaintextCredentials new
						username: 'anUser';
						password: '*****';
						yourself) ]
		raise: Deprecation