I am an iceberg repository that uses libgit as backend.
I have a handle to a LGitRepository that is lazily initialized on usage, and cleaned up on every shutdown (automatically done by uFFI).

Every access to the libgit repository should be wrapped with a call to #handleLibgitError: to manage possible libgit errors and transform them to a correct iceberg error.