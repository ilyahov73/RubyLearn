class Configus
    class InHash
      attr_reader :inner_hash
   
      def initialize
        @inner_hash = {}
      end
   
      def method_missing(name, *args, &block)
        if block_given?
          context = InHash.new
          context.instance_eval &block
   
          @inner_hash[name] = context
        elsif args.empty?
          @inner_hash[name]
        else
          @inner_hash[name] = args 
        end
      end
    end
   
    def self.deep_merge(target, source)
      source.inner_hash.each_pair do |key, value|
        current_pair = target.inner_hash[key]

        target.inner_hash[key] =
          if current_pair.is_a?(InHash) && value.is_a?(InHash)
            deep_merge(current_pair, value)
          else
            value
          end
      end
   
      return target
    end
   
    def self.config(environment, parent_environment = nil, &block)
      in_hash = InHash.new
      in_hash.instance_eval &block
   
      keys = in_hash.inner_hash.keys
      index = keys.find_index(environment)
   
      if parent_environment && environment
        parent_environment_hash = in_hash.inner_hash[parent_environment]
        environment_hash = in_hash.inner_hash[environment]
        deep_merge(parent_environment_hash, environment_hash)
      elsif environment == keys[index]
        in_hash.inner_hash[environment]
      end
    end
  end

  config = Configus.config :staging, :production do
    production do
      key1 "value1"
      key2 "value2"
      group1 do
        key3 "value3"
        key4 "value4"
      end
    end
   
    staging do
      key2 "new value2"
      group1 do
        key4 "new value4"
      end
    end
  end
   
  puts config.key1
  puts config.key2
  puts config.group1.key3
  puts config.group1.key4