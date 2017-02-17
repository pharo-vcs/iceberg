private
plaintextCredentials
	| credentials | 
	
	credentials := IcePlaintextCredentials new.
	IceCredentialsProvider default providePlaintextCredentialsTo: credentials.
	^ credentials	
