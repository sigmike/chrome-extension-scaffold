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
      class_option :haml, :default => true, :type => :boolean
      
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
        if haml?
          template "background.html.haml"
        else
          template "background.html"
        end
      end
      
      def install_background_js
        template "background.js"
      end
      
      def install_content_js
        template "content.js"
      end
      
      def install_watcher
        if watcher?
          template "Gemfile"
          inside do
            Bundler.with_clean_env do
              run "bundle install"
            end
          end
          template "watcher"
          chmod "watcher", 0755
        end
      end
      
      protected
      def jquery?
        options[:jquery]
      end

      def haml?
        options[:jquery]
      end
      
      def watcher?
        haml?
      end
      
      def coffee?
        false
      end
    end
  end
end
