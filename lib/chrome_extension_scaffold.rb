require "chrome_extension_scaffold/version"
require 'thor/group'

module ChromeExtensionScaffold
  module Generators
    class Scaffold < Thor::Group
      include Thor::Actions
      namespace ""
      argument :name
      source_root File.expand_path("../../template", __FILE__)
      
      class_option :jquery, :default => true, :type => :boolean
      
      def set_root
        empty_directory name
        self.destination_root = name
      end
      
      def create_dir
        template "manifest.json"
      end
      
      protected
      def jquery?
        options[:jquery]
      end
    end
  end
end
