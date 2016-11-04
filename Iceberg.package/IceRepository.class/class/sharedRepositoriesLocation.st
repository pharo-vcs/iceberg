accessing
sharedRepositoriesLocation
	^ SharedRepositoriesLocation ifNil: [ FileLocator home / #iceberg ]