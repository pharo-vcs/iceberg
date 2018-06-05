running
setUp
	super setUp.
	store := IceCredentialStore new.
	dialog := IceTipAskForPlaintextCredentialsModel new
		credentialStore: store;
		yourself