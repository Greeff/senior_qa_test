# Senior QA Test
Technical test for Senior QA Analyst

# Execution Profiles
## Strict mode
```
cucumber -p strict
```
Failing API calls will thrown an exception automatically.

## Debug mode
```
cucumber -p debug
```
Pauses the test execution when an exception is thrown.

## Default mode
```
cucumber
```
Failing API calls will not throw an exception automatically. The test framework will carry on running, distributing the failed API response back to the calling method for further processing.

e.g. Sending the failed response for further processing in a verification method.

# Instructions
1. Install Bundler and do a bundle install to install the required Gems for this framework:

  ```
  bundle install
  ```
2. Run cucumber with the desired execution profile along with the login credentials:

  ```
  cucumber -p {execution_profile} ID={login_id} KEY={api_key}
  ```
3. Or you can choose to go with the default profile:

  ```
  cucumber ID={login_id} KEY={api_key}
  ```
	
# Framework Structure
## Page Object Model structure
### Pry
A gem which allows test execution to pause at any given time and provides a Ruby CLI for further debugging.

```
binding.pry
```

### Generic class
Contains a method for sending a GET and POST requests and can be further extended to support other HTTP requests. These response from these requests are then wrapped around a debug method which decides whether or not to throw an exception if the response has failed.

**SENDING API REQUESTS**

```ruby
def method_missing(method_name, contents)
  raise("Request invalid: #{method_name}") unless requests_list.include? method_name

  response = HTTParty.send(method_name, 
    base_url + contents[:path],
    headers: contents[:headers] || {},
    body: contents[:body] || {}
  )

  debug(:api_call) { response }
end
```

**DEBUG**

```
def debug(&block)
  begin
    raise(yield.to_s) unless yield.success? if !ENV['STRICT'].nil?
    yield
  rescue => e
    ENV['DEBUG'].nil? ? raise(e.message) : binding.pry
  end
end
```

### Instantiator Class
Contains a single method for instantiating page classes dynamically. Page objects will then remain in memory throughout the entire test framework execution.

**METHOD MISSING**

```ruby
def self.method_missing(method_name, *arguments, &block)
  @@apis ||= Hash.new
  class_name = method_name.to_s.split('_').collect(&:capitalize).join
  @@apis[method_name] ||= Object.const_get(class_name).new
end
```