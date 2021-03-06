## Migrating to google-cloud-asset 1.0

The 1.0 release of the google-cloud-asset client is a significant upgrade
based on a [next-gen code generator](https://github.com/googleapis/gapic-generator-ruby),
and includes substantial interface changes. Existing code written for earlier
versions of this library will likely require updates to use this version.
This document describes the changes that have been made, and what you need to
do to update your usage.

To summarize:

 *  The library has been broken out into multiple libraries. The new gems
    `google-cloud-asset-v1` and `google-cloud-asset-v1beta1` contain the
    actual client classes for versions V1 and V1beta1 of the Asset service,
    and the gem `google-cloud-asset` now simply provides a convenience wrapper.
    See [Library Structure](#library-structure) for more info.
 *  The library uses a new configuration mechanism giving you closer control
    over endpoint address, network timeouts, and retry. See
    [Client Configuration](#client-configuration) for more info. Furthermore,
    when creating a client object, you can customize its configuration in a
    block rather than passing arguments to the constructor. See
    [Creating Clients](#creating-clients) for more info.
 *  Previously, positional arguments were used to indicate required arguments.
    Now, all method arguments are keyword arguments, with documentation that
    specifies whether they are required or optional. Additionally, you can pass
    a proto request object instead of separate arguments. See
    [Passing Arguments](#passing-arguments) for more info.
 *  Previously, some client classes included class methods for constructing
    resource paths. These paths are now instance methods on the client objects,
    and are also available in a separate paths module. See
    [Resource Path Helpers](#resource-path-helpers) for more info.
 *  Some classes have moved into different namespaces. See
    [Class Namespaces](#class-namespaces) for more info.

### Library Structure

Older 0.x releases of the `google-cloud-asset` gem were all-in-one gems
that included potentially multiple clients for multiple versions of the
Asset service. The `Google::Cloud::Asset.new` factory method would
return you an instance of a `Google::Cloud::Asset::V1::AssetServiceClient`
object for the V1 version of the service, or a
`Google::Cloud::Asset::V1beta1::AssetServiceClient` object for the
V1beta1 version of the service. All these classes were defined in the same gem.

With the 1.0 release, the `google-cloud-asset` gem still provides factory
methods for obtaining clients. (The method signatures will have changed. See
[Creating Clients](#creating-clients) for details.) However, the actual client
classes have been moved into separate gems, one per service version. The
`Google::Cloud::Asset::V1::AssetService::Client` class, along with its
helpers and data types, is now part of the `google-cloud-asset-v1` gem.
Similarly, the `Google::Cloud::Asset::V1beta1::AssetService::Client`
class is part of the `google-cloud-asset-v1beta1` gem.

For normal usage, you can continue to install the `google-cloud-asset` gem
(which will bring in the versioned client gems as dependencies) and continue to
use factory methods to create clients. However, you may alternatively choose to
install only one of the versioned gems. For example, if you know you will only
use `V1` of the service, you can install `google-cloud-asset-v1` by
itself, and construct instances of the
`Google::Cloud::Asset::V1::AssetService::Client` client class directly.

### Client Configuration

In older releases, if you wanted to customize performance parameters or
low-level behavior of the client (such as credentials, timeouts, or
instrumentation), you would pass a variety of keyword arguments to the client
constructor. It was also extremely difficult to customize the default settings.

With the 1.0 release, a configuration interface provides control over these
parameters, including defaults for all instances of a client, and settings for
each specific client instance. For example, to set default credentials and
timeout for all Asset V1 clients:

```
Google::Cloud::Asset::V1::AssetService::Client.configure do |config|
  config.credentials = "/path/to/credentials.json"
  config.timeout = 10_000
end
```

Individual RPCs can also be configured independently. For example, to set the
timeout for the `create_feed` call:

```
Google::Cloud::Asset::V1::AssetService::Client.configure do |config|
  config.rpcs.create_feed.timeout = 20_000
end
```

Defaults for certain configurations can be set for all Asset versions and
services globally:

```
Google::Cloud::Asset.configure do |config|
  config.credentials = "/path/to/credentials.json"
  config.timeout = 10_000
end
```

Finally, you can override the configuration for each client instance. See the
next section on [Creating Clients](#creating-clients) for details.

### Creating Clients

In older releases, to create a client object, you would use the
`Google::Cloud::Asset.new` class method. Keyword arguments were available to
select a service version and to configure parameters such as credentials and
timeouts.

With the 1.0 release, use the `Google::Cloud::Asset.asset_service` class
method to create a client object. You may select a service version using the
`:version` keyword argument. However, other configuration parameters should be
set in a configuration block when you create the client.

Old:
```
client = Google::Cloud::Asset.new credentials: "/path/to/credentials.json"
```

New:
```
client = Google::Cloud::Asset.asset_service do |config|
  config.credentials = "/path/to/credentials.json"
end
```

The configuration block is optional. If you do not provide it, or you do not
set some configuration parameters, then the default configuration is used. See
[Client Configuration](#client-configuration).

### Passing Arguments

In older releases, required arguments would be passed as positional method
arguments, while most optional arguments would be passed as keyword arguments.

With the 1.0 release, all RPC arguments are passed as keyword arguments,
regardless of whether they are required or optional. For example:

Old:
```
client = Google::Cloud::Asset.new

name = "projects/my-project/feeds/my-feed"

# Name is a positional argument
response = client.get_feed name
```

New:
```
client = Google::Cloud::Asset.asset_service

name = "projects/my-project/feeds/my-feed"

# Name is a keyword argument
response = client.get_feed name: name
```

In the 1.0 release, it is also possible to pass a request object, either
as a hash or as a protocol buffer.

New:
```
client = Google::Cloud::Asset.asset_service

request = Google::Cloud::Asset::V1::GetFeedRequest.new(
  name: "projects/my-project/feeds/my-feed"
)

# Pass a request object as a positional argument:
response = client.get_feed request
```

Finally, in older releases, to provide call options, you would pass a
`Google::Gax::CallOptions` object with the `:options` keyword argument. In the
1.0 release, pass call options using a _second set_ of keyword arguments.

Old:
```
client = Google::Cloud::Asset.new

name = "projects/my-project/feeds/my-feed"

options = Google::Gax::CallOptions.new timeout: 10_000

response = client.get_feed name, options: options
```

New:
```
client = Google::Cloud::Asset.asset_service

name = "projects/my-project/feeds/my-feed"

# Use a hash to wrap the normal call arguments (or pass a request object), and
# then add further keyword arguments for the call options.
response = client.get_feed({ name: name }, timeout: 10_000)
```

### Resource Path Helpers

The client library includes helper methods for generating the resource path
strings passed to many calls. These helpers have changed in two ways:

* In older releases, they are _class_ methods on the client class. In the 1.0
  release, they are _instance_ methods on the client. They are also available
  on a separate paths module that you can include elsewhere for convenience.
* In older releases, arguments to a resource path helper are passed as
  _positional_ arguments. In the 1.0 release, they are passed as named _keyword_
  arguments. Some helpers also support different sets of arguments, each set
  corresponding to a different type of path.

Following is an example involving using a resource path helper.

Old:
```
client = Google::Cloud::Asset.new

# Call the helper on the client class
name = Google::Cloud::Asset::V1::AssetServiceClient.feed_path(
  "my-project", "my-feed"
)

response = client.get_feed name
```

New:
```
client = Google::Cloud::Asset.asset_service

# Call the helper on the client instance, and use keyword arguments
name = client.feed_path project: "my-project", feed: "my-feed"

response = client.get_feed name: name
```

In the 1.0 client, you can also use the paths module as a convenience module.

New:
```
# Bring the session_path method into the current class
include Google::Cloud::Asset::V1::AssetService::Paths

def foo
  client = Google::Cloud::Asset.asset_service

  # Call the included helper method
  name = feed_path project: "my-project", feed: "my-feed"

  response = client.get_feed name: name

  # Do something with response...
end
```

### Class Namespaces

In older releases, the client object was of classes with names like:
`Google::Cloud::Asset::V1::AssetServiceClient`.
In the 1.0 release, the client object is of a different class:
`Google::Cloud::Asset::V1::AssetService::Client`.
Note that most users will use the factory methods such as
`Google::Cloud::Asset.asset_service` to create instances of the client object,
so you may not need to reference the actual class directly.
See [Creating Clients](#creating-clients).

In older releases, the credentials object was of class
`Google::Cloud::Asset::V1::Credentials`.
In the 1.0 release, each service has its own credentials class, e.g.
`Google::Cloud::Asset::V1::AssetService::Credentials`.
Again, most users will not need to reference this class directly.
See [Client Configuration](#client-configuration).
