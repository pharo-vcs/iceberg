"Since the libgit library was already loaded, it was already initialized at startup.
We should shutdown it until there are no more inits, so the Initialized flag is set to zero"
LGitLibrary uniqueInstance shutdownLibGit2 asString.

"Enable metacello integration by default"
Iceberg enableMetacelloIntegration: true.

"Cleanup some global variables that seem dirty on CI updates"
IceLibgitRepository defaultFileFormatType: nil.

IcePharoPlugin addPharoProjectToIceberg.