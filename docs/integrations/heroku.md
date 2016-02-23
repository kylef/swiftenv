# Heroku

The [Swift buildpack for Heroku](https://github.com/kylef/heroku-buildpack-swift)
automatically makes use of swiftenv and will automatically install the local
version of Swift you've specified in your `.swift-version` file.

## Usage

Example usage:

```shell
$ ls
Procfile Package.swift Sources .swift-version

$ heroku create --buildpack https://github.com/kylef/heroku-buildpack-swift.git

$ git push heroku master
remote: -----> Swift app detected
remote: -----> Installing Swift DEVELOPMENT-SNAPSHOT-2016-02-08-a
remote: -----> Installing clang-3.7.0
remote: -----> Building Package
remote: -----> Copying binaries to 'bin'
```

You can also add it to upcoming builds of an existing application:

```shell
$ heroku buildpacks:set https://github.com/kylef/heroku-buildpack-swift.git
```

The buildpack will detect your app as Swift if it has a `Package.swift` file in
the root.

### Procfile

Using the Procfile, you can set the process to run for your web server. Any
binaries built from your Swift source using swift package manager will
be placed in your $PATH.

```swift
web: HelloWorld --workers 3 --bind 0.0.0.0:$PORT
```
