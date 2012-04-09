require "chrome_extension_scaffold/version"
require 'thor/group'

module ChromeExtensionScaffold
  module Generators
    class Scaffold < Thor::Group
      include Thor::Actions
      namespace ""
      argument :name
      
      def say_hello
        say "hello"
      end
    end
  end
end
