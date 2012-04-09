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
      
      def create_root
        empty_directory name
        self.destination_root = name
      end
      
      def install_manifest
        template "manifest.json"
      end
      
      def install_jquery
        copy_file "jquery.js" if jquery?
      end
      
      def install_background_html
        template "background.html"
      end
      
      def install_background_js
        template "background.js"
      end
      
      def install_content_js
        template "content.js"
      end
      
      protected
      def jquery?
        options[:jquery]
      end
    end
  end
end
