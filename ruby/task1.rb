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
          @inner_hash[name] = args # NOTICE: args is array
        end
      end
    end
   
    def self.deep_merge(target, source)
      # source.each_pair do |k, v|
      source.inner_hash.each_pair do |k, v|
        # tv = target[k]
        tv = target.inner_hash[k]
   
        target.inner_hash[k] =
          if tv.is_a?(InHash) && v.is_a?(InHash)
            deep_merge(tv, v)
          else
            v
          end
      end
   
      target
    end
   
    def self.config(environment, parent = nil, &block)
      in_hash = InHash.new
      in_hash.instance_eval &block
   
      keys = in_hash.inner_hash.keys
      index = keys.find_index(environment)
   
      if parent && environment
        parent_hash = in_hash.inner_hash[parent]
        adopted_hash = in_hash.inner_hash[environment]
        # merged_hash = deep_merge(parent_hash, adopted_hash)
        # in_hash
        deep_merge(parent_hash, adopted_hash)
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