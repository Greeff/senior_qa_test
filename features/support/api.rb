class API
  include Singleton

  # no need to define a method for each page classes
  # page classes will be dynamically created and will remain
  # in memory until the framework exits
  # refer to the README for naming conventions
  def self.method_missing(method_name, *arguments, &block)
    @@apis ||= Hash.new
    class_name = method_name.to_s.split('_').collect(&:capitalize).join
    @@apis[method_name] ||= Object.const_get(class_name).new
  end
end
