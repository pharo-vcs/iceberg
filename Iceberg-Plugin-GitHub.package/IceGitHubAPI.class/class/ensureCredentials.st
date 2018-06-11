credentials
ensureCredentials
	| provider newCredentials |

	provider := IceCredentialsProvider defaultForHost: 'github.com'. 
	newCredentials := IcePlaintextCredentials new.
	provider providePlaintextCredentialsTo: newCredentials.
	^ newCredentials