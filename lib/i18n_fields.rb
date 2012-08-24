# Author::    Maurizio Casimirri (mailto:maurizio.cas@gmail.com)
# Copyright:: Copyright (c) 2012 Maurizio Casimirri
# 
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

require 'globalize3'
require 'active_record_schema'
module I18nFields
  module TranslatableFields
    extend ActiveSupport::Concern
  
    module ClassMethods
      def field(field_name, *args)
    
        options = args.extract_options!
        multilingual = options.delete(:translatable) || options.delete(:multilingual)
        args << options
      
        if multilingual
          @has_translations = true
          translates field_name
          
          self::Translation.class_eval do
            # belongs_to association with translated model is already added by globalize
            
            field field_name, *args
            field :locale
            index :locale
            schema.indexes.keys.each {|k|
              schema.indexes[k].options ||= {}
              schema.indexes[k].options[:name] = "index_#{SecureRandom::uuid}" # avoid index_name too long error
            }
            timestamps
          end
          
        else
          super(field_name, *args)
        end
        
      end
    
      def has_translations?
        !!@has_translations
      end    
    end

  end
end

ActiveRecord::Base.send :include, I18nFields::TranslatableFields

