class Module
      def attribute(params, &block)
          init = if params.is_a? Hash 
                    then { name: params.keys.first, val: params.values.first } 
                    else { name: params }
                 end                  
          
          define_method(init[:name]) do
            init[:val] ||= instance_eval &block if block_given?
            @attr ||= init[:val]
          end
          define_method(init[:name] + '=') do |val| 
            @attr = val
          end
          define_method(init[:name] + '?') do
            !@attr.nil?
          end
       end
end