class NullObject
  instance_methods.each { |m| undef_method m unless m =~ /^__|instance_eval|object_id/ }
end

class DrunkProxy < NullObject
 
  def initialize(*objects_arr)
    @objects = []
    objects_arr.each do |index|
      index.each do |value|
        @objects << value
      end
    end
  end
 
  def method_missing(method_name, *arguments, &block)
    has_method(method_name)
  end
 
  def has_method(name)
    @check = false;
    @return_value = []
    @objects.each do |value|
      if value.methods.include?(name.to_sym)
        @return_value << value.send(name)
        @check = true;
      end
    end
    raise NoMethodError.new("No method such as \"#{name}\" found!") if !@check
    @return_value
  end

  def self.const_missing(name)
    puts "self miss"
    ::Object.const_get(name)
  end
 
end
 
proxy = DrunkProxy.new ['foo', [24], {x: 2}, -42]
puts proxy.class 
puts proxy.to_s
puts proxy.abs
puts proxy.reverse
puts proxy.length
