accessing
sharedRepositoriesLocation
	^ SharedRepositoriesLocation ifNil: [ StartupPreferencesLoader preferencesGeneralFolder / #iceberg ]