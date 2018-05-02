I check that every libgit call should be wrapped with an error handler (IceLibgitRepository libgitErrorHandlerSelector).

Otherwise, libgit errors may be thrown to the user and produce ugly effects. E.g.,
	- Iceberg UI only manages Iceberg errors
	- Libgit errors are criptyc and can only be understood by reading the message text...