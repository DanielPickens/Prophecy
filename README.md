# Prophecy

Prophecy is a gem wrapper for the Helm CLI, making it easier to visualize Helm Charts! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `scr/prophecy/cli`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'prophecy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install prophecy

## Usage

Configuration example:

```ruby
Github.configure do |config|
  config.endpoint       = 'https://example.net/api/v4' # API endpoint URL, default: ENV['GITHUB_API_ENDPOINT'] and falls back to ENV['CI_API_V4_URL']
  config.private_token  = 'qEsq1pt6HJPaNciie3MG'       # user's private token or OAuth2 access token, default: ENV['GITHUB_API_PRIVATE_TOKEN']
  # Optional
  # config.user_agent   = 'Custom User Agent'          # user agent, default: 'GitHub Ruby Gem [version]'
  # config.sudo         = 'user'                       # username for sudo mode, default: nil
end
```


Usage examples:

```ruby
# set an API endpoint
Github.endpoint = 'https://example.net/api/v4'
# => "https://example.net/api/v4"

# set a user private token
Github.private_token = 'qEsq1pt6HJPaNciie3MG'
# => "qEsq1pt6HJPaNciie3MG"

# configure a proxy server
Github.http_proxy('proxyhost', 8888)
# proxy server with basic auth
Github.http_proxy('proxyhost', 8888, 'proxyuser', 'strongpasswordhere')
# set timeout for responses
ENV['GITHUB_API_HTTPARTY_OPTIONS'] = '{read_timeout: 60}'

# list projects
Github.projects(per_page: 5)
# => [#<Github::ObjectifiedHash:0x000000023326e0 @data={"id"=>1, "code"=>"brute", "name"=>"Brute", "description"=>nil, "path"=>"brute", "default_branch"=>nil, "owner"=>#<Github::ObjectifiedHash:0x00000002331600 @data={"id"=>1, "email"=>"daniel@example.com", "name"=>"Daniel Smith", "blocked"=>false, "created_at"=>"2012-09-17T09:41:56Z"}>, "private"=>true, "issues_enabled"=>true, "merge_requests_enabled"=>true, "wall_enabled"=>true, "wiki_enabled"=>true, "created_at"=>"2012-09-17T09:41:56Z"}>, #<Github::ObjectifiedHash:0x000000023450d8 @data={"id"=>2, "code"=>"mozart", "name"=>"Mozart", "description"=>nil, "path"=>"mozart", "default_branch"=>nil, "owner"=>#<Github::ObjectifiedHash:0x00000002344ca0 @data={"id"=>1, "email"=>"daniel@example.com", "name"=>"Daniel Smith", "blocked"=>false, "created_at"=>"2012-09-17T09:41:56Z"}>, "private"=>true, "issues_enabled"=>true, "merge_requests_enabled"=>true, "wall_enabled"=>true, "wiki_enabled"=>true, "created_at"=>"2012-09-17T09:41:57Z"}>, #<Github::ObjectifiedHash:0x00000002344958 @data={"id"=>3, "code"=>"github", "name"=>"Github", "description"=>nil, "path"=>"gitlab", "default_branch"=>nil, "owner"=>#<Github::ObjectifiedHash:0x000000023447a0 @data={"id"=>1, "email"=>"daniel@example.com", "name"=>"Daniel Smith", "blocked"=>false, "created_at"=>"2012-09-17T09:41:56Z"}>, "private"=>true, "issues_enabled"=>true, "merge_requests_enabled"=>true, "wall_enabled"=>true, "wiki_enabled"=>true, "created_at"=>"2012-09-17T09:41:58Z"}>]

# initialize a new client with custom headers
g = Github.client(
  endpoint: 'https://example.com/api/v4',
  private_token: 'qEsq1pt6HJPaNciie3MG',
  httparty: {
    headers: { 'Cookie' => 'github_canary=true' }
  }
)
# => #<Github::Client:0x00000001e62408 @endpoint="https://api.example.com", @private_token="qEsq1pt6HJPaNciie3MG", @user_agent="Github Ruby Gem 2.0.0">

# get a user
user = g.user
# => #<Github::ObjectifiedHash:0x00000002217990 @data={"id"=>1, "email"=>"Daniel@example.com", "name"=>"Daniel Smith", "bio"=>nil, "skype"=>"", "linkedin"=>"", "twitter"=>"daniel", "dark_scheme"=>false, "theme_id"=>1, "blocked"=>false, "created_at"=>"2012-09-17T09:41:56Z"}>

# get a user's email
user.email
# => "daniel@example.com"

# set a sudo mode to perform API calls as another user
Github.sudo = 'other_user'
# => "other_user"

# disable a sudo mode
Github.sudo = nil
# => nil

# set the private token to an empty string to make unauthenticated API requests
Github.private_token = ''
# => ""

# a paginated response
projects = Github.projects(per_page: 5)

# check existence of the next page
projects.has_next_page?

# retrieve the next page
projects.next_page

# iterate all projects
projects.auto_paginate do |project|
  # do something
end

# retrieve all projects as an array
projects.auto_paginate
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DanelPickens/prophecy.git

## Todo

- Add open telemetry auto instrumentation to the gem

- ~~Set up ci/cd workflows~~

- Add dependencies of the local gem to a rails plugin/engine in a gemfile.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
