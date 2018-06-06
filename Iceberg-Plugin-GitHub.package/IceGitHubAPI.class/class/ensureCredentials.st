credentials
ensureCredentials
	| provider newCredentials |

	provider := IceCredentialsProvider defaultForRemote: (IceSimpleRemote for: 'github.com'). 
	newCredentials := IcePlaintextCredentials new.
	provider providePlaintextCredentialsTo: newCredentials.
	^ newCredentials