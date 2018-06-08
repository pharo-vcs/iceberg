I transform libgit errors into Iceberg errors using a double dispatch.
In case there is no case implemented for an exception a generic error will be raised instead.

Each case in the double dispatch implements transformations for a specific kind of libgit error such as ENOTFOUND, ECONFLICT and so on. However, each libgit error can be mapped to several high-level Iceberg exceptions. It is the responsibility of this error visitor to do the matching of the different information provided by a libgit error (error code, description, message text) and decide which exception to use.

I also have a context, which points to the object that is requesting the exception transformation.
This context is used to obtain more information about the operation that failed, usually not provided by Libgit, such as urls, locations, etc.