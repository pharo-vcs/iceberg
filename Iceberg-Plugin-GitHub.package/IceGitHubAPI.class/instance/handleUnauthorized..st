responses
handleUnauthorized: aZnResponse 
	"If we are in unauthorized we require the correct credentials."
	
	| newCredentials githubOtp |
	aZnResponse isSuccess ifTrue: [ ^ self ].
	aZnResponse status ~= 401 ifTrue: [ ^ self ].

	"Does this require two factor authentication now?"
	githubOtp := aZnResponse headers at: 'X-Github-Otp' ifAbsent: [ nil ].
	newCredentials := githubOtp = 'required; app'
		ifTrue: [ IcePlaintextOtpCredentials new ]
		ifFalse: [ IcePlaintextCredentials new ].
	
	"Ignoring if you press cancel"
	(IceCredentialsProvider defaultForHost: 'github.com')
		obtainCredentials: newCredentials.
	IceAuthenticationError signal: 'Retry to use the new credentials'
	