class API
  include Singleton

  def self.method_missing(method_name, *arguments, &block)
    @@apis ||= Hash.new
    class_name = method_name.to_s.split('_').collect(&:capitalize).join
    @@apis[method_name] ||= Object.const_get(class_name).new
  end
end
