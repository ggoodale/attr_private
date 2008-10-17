require 'activerecord'

module AttrPrivate
  def self.included(base)
    base.extend(SingletonMethods)
  end
  
  # This provides the ability to mark a field on a record as private, preventing access from 
  # outside an instance of the class.
  #
  module SingletonMethods
    
    def attr_private(*fields)

      write_inheritable_attribute :private_fields, fields
      class_inheritable_reader :private_fields

      extend ClassMethods

      fields.each {|field|
        begin
          column = connection.columns(table_name, "AttrPrivate").detect{|column| column.name.to_sym == field.to_sym} 
        rescue => e
          # If an error occurs looking up the column, we're probably in a context where the db isn't populated.  
          # Do nothing.
          next
        end
        raise ActiveRecord::ActiveRecordError, "Unknown field #{field}" if column.nil?

        puts "protecting #{field}"
        # prevent bulk assignment
        attr_protected field
        
        # prevent use of the standard accessors
        module_eval <<-"end_eval", __FILE__, __LINE__
          def #{field}
            raise ::NoMethodError, "undefined method \`#{field}' for \#{self}"
          end
          def #{field}=(x)
            raise ::NoMethodError, "undefined method \`#{field}=' for \#{self}"
          end
          def #{field}?
            raise ::NoMethodError, "undefined method \`#{field}?' for \#{self}"
          end
        end_eval
      }
    end
            
    module ClassMethods
      def method_missing_with_parameter_exclusion(name, *args)
        private_fields.each do |field|
          raise ::NoMethodError, "undefined method `#{name}' for #{self}" if /_#{field}_|_#{field}$/.match(name.to_s)
        end
        method_missing_without_parameter_exclusion(name, args) 
      end

      alias_method :method_missing_without_parameter_exclusion, :method_missing
      alias_method :method_missing, :method_missing_with_parameter_exclusion
    end
        
  end
end

class ActiveRecord::Base
  include AttrPrivate
end