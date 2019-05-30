# Minimal rack-based HTTP redirect

This rack app to provide a minimal, basic HTTP redirect. It can be deployed straight to any cloud platform.

The original requirement was to allow an old URL to continue working for users that had it in their bookmarks, but with 
the caveat we needed also the path and any potential query params to be propagated to the new (target) domain.

An S3 / Route 53 based solution would have only allowed us to redirect the domain, but not the path nor query params.

# How to use it

Deploy the `master` branch to any cloud provider with support for Ruby/Rack, for example Heroku.

Configure the target URL and, optionally, the redirect HTTP status code, with the following ENV variables:

```
  REDIRECT_TARGET, for example, https://example.com
  REDIRECT_STATUS, by default if not present, will be 302
```

# How to run locally

Clone the repo and install, if needed, bundler, and the gems. Then run the server:

* `REDIRECT_TARGET=https://example.com bundle exec rackup`

or, if you want to change the default port:

* `REDIRECT_TARGET=https://example.com bundle exec rackup -p 9191`

Then just go to a browser or use `curl -I http://localhost:9191` (change the port accordingly).

# How to run the tests

```
$ bundle exec rspec
......

Finished in 0.01354 seconds (files took 0.08652 seconds to load)
6 examples, 0 failures
```
