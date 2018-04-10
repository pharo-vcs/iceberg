I am a tree implementation used for diffing and merging.

I work by composition and not inheritance. My users should use the values of the node (kept in the #value instance variable) and not subclass myself.
Each node stores its child nodes in a dictionary, indexed by a key.

Tree API:
 - #/ access to children
 - #path get the path of the current node in the tree
 - #parent get the parent node of the current node
 - #rootNode get the root node of the current tree
 - #children get the children of the current node
 - #keys, #keysDo:, #includesKey: enumerate the keys of the node
 - #at:put, #childAt:ifAbsentPut:, #childAt:ifPresent:
 - #resolve:, #resolve:ifAbsent: resolve a path in the current node
 - #replaceBy: replaces the current node by another node
 - #replace:with: replaces the given child node by another node

Enumerating API:
 - #allSatisfy:
 - #anySatisfy:
 - #collect:
 - #detect:
 - #select:
 - #count:
 - #do:

Visiting API:
 - visit: