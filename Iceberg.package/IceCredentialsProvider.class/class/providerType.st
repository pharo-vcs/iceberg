private
providerType
	^ ProviderType ifNil: [ ProviderType := self defaultCredentialProviderClass ]