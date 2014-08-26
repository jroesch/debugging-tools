require 'pry'
require 'colorize'
require 'active_record'

def watch_class_or_module_with(klass)
  trace = TracePoint.new(:class) do |tp|
    if tp.self == klass
      yield tp
    end
  end

  trace.enable
end

def warn_class(klass, watch_method)
  watch_class_or_module_with(klass) do |tp|
    if klass.instance_methods.include?(watch_method.to_sym)
      p "#{klass} was opened on line: #{tp.lineno} by:\n#{pretty_caller(caller)}"
    end
  end
end

def protect_class(klass)
  watch_class_or_module_with(klass) do |tp|
    raise "#{klass} was opened on line: #{tp.lineno} by:\n#{pretty_caller(caller)}"
  end
end

def pretty_caller(caller)
  caller.map { |line| "\t" + line }.join("\n").red
end
