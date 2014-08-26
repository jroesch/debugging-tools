module TrapPoint
  module Call
    extend self

    def watch_method(watch_method)
      begin 
        method(watch_method.to_sym).source_location
        trace = TracePoint.new(:c_call) do |tp|
          p "#{[tp.lineno, tp.defined_class, tp.method_id, tp.event]}: by: #{pretty_caller(caller)}"
        end
      rescue
        trace = TracePoint.new(:call) do |tp|
          p "Referencing a native function: metadata => #{[tp.lineno, tp.defined_class, tp.method_id, tp.event]}: by: #{pretty_caller(caller)}"
        end
      end

      trace.enable
    end
  end
end
