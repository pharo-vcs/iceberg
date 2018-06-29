# Recovering Code
An important use cases when using a version control system is the ability to recover code (particularly Smalltalk classes).

The Iceberg UI currently supports some basic recovery scenarios via the use of its Repository Explorer window. This window shows you the [commit id's](Iceberg-glossary.md) and tags for a project, where you can compare with previous revisiions and revert some basic changes.

This area of the interface is ripe for [improvements](Contributing-to-Iceberg.md), however because Iceberg is based on git, it is possible to issue basic git commands from an OS terminal session.

## Useful Git Commands    

This section will continue to be augmented with commands/scenarios that we find useful, however here are a few.

NOTE: the examples assume that you have created your Iceberg repository in directory named src (which is a common convention)

### Finding Commit ID's for known classes

If you find that you want to know what changes were made to a class, so that you can easily lookup commits in Iceberg - try:

```
git log --follow src/*/<class name>.*

e.g.

git log --follow src/*/IconShortcutRule.*
```

### Recover a deleted Class

If you need to recover a class, you first you need to find the commit ID where the class was deleted. You can use the change history of the class (as outlined above) or you can list all deleted classes and pick out the id like this:

```$xslt
git log --diff-filter=D --summary --pretty='format:%cd | %h | %H | %cn%n-> %s%n'
```

Having established the commit ID (the short hash is fine) you now need to checkout the previous version of the file that was available in the commit before deletion (Note: *this last point is quite subtle - if you try and restore from the commit where deletion happened, the file will no longer be there to recover, thus pay attention to the ~1 suffix after the ID*).
```
git checkout <commit id>~1 src/<path to file>/<filename.class.st>

e.g.

git checkout b4a285a61~1~1 src/Polymorph-Widgets-Rules/IconShortcutRule.class.st
```