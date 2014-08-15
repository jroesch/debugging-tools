require 'pry'
require 'colorize'

def watch_class_with(klass)
  trace = TracePoint.new(:class) do |tp|
    if tp.self == klass
      yield tp
    end
  end

  trace.enable
end

def warn_class(klass)
  watch_class_with(klass) do
    puts "Someone opened #{klass}"
  end
end

def protect_class(klass)
  watch_class_with(klass) do |tp|
    raise "#{klass} was opened on line: #{tp.lineno} by:\n#{pretty_caller(caller)}"
  end
end

def pretty_caller(caller)
  caller.map { |line| "\t" + line }.join("\n").red
end
