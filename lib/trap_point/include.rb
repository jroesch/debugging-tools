module TrapPoint
  module Include
    extend self

    def watch_include_statements
      trace = TracePoint.new(:class) do |tp|
        p [tp.self.class, tp.self.included_modules]
      end

      trace.enable
    end
  end
end
