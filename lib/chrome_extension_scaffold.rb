require "chrome_extension_scaffold/version"
require 'thor/group'

module ChromeExtensionScaffold
  module Generators
    class Scaffold < Thor::Group
      include Thor::Actions
      namespace ""
      argument :name
      source_root File.expand_path("../../template", __FILE__)
      
      add_runtime_options!
      class_option :jquery, :default => true, :type => :boolean
      class_option :haml, :default => true, :type => :boolean
      class_option :coffee, :default => true, :type => :boolean
      
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
        template "background.js#{".coffee" if coffee?}"
      end
      
      def install_content_js
        template "content.js#{".coffee" if coffee?}"
      end
      
      def install_watcher
        if watcher?
          template "Gemfile"
          inside do
            if defined? Bundler
              Bundler.with_clean_env do
                run "bundle install"
              end
            else
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
      
      def coffee?
        options[:coffee]
      end
      
      def watcher?
        haml? or coffee?
      end
    end
  end
end
