"Shutdown Libgit"
LGitLibrary shutDown: true.

"Unregister all iceberg repository adapters since we are going to unload all code related to it.
Otherwise obsolete instances will stay".
IceMetacelloRepositoryAdapter allInstances do: #unregister.
Smalltalk globals at: #IceSystemEventListener ifPresent: #unregisterSystemAnnouncements.

"Workaround to avoid keeping an entry in World Menu to the obsolete class."
(IceTipRepositoriesBrowser class>>#menuCommandOn:) removeFromSystem.

"Remove iceberg from system (so I can reload it)"
MetacelloPharoPlatform select.
#(
    'BaselineOfLibGit'
    'BaselineOfIceberg'
)
do: [ :each |
    (each asPackageIfAbsent: [ 
        (each , ' not found') traceCr.
        nil ])
            ifNotNil: [ :package |
                ('Removing ', each) traceCr.
                package removeFromSystem ] ]
