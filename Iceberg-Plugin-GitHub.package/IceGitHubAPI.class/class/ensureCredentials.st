credentials
ensureCredentials
	| provider newCredentials |

	provider := IceCredentialsProvider default.
	newCredentials := IcePlaintextCredentials new.
	provider providePlaintextCredentialsTo: newCredentials.
	^ newCredentials