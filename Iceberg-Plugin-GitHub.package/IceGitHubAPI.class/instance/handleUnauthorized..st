responses
handleUnauthorized: aZnResponse 
	"If we are in unauthorized we require the correct credentials."
	
	| newCredentials |
	aZnResponse isSuccess ifTrue: [ ^ self ].
	aZnResponse status ~= 401 ifTrue: [ ^ self ].
	
	newCredentials := IcePlaintextCredentials new.
	
	"Ignoring if you press cancel"
	(IceCredentialsProvider defaultForHost: 'github.com')
		obtainPlaintextCredentials: newCredentials.
		
	IceAuthenticationError signal: 'Retry to use the new credentials'
	