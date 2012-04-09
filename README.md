# Chrome extension scaffold

Generate a scaffold for a Chrome extension.

By default it generates HAML and CoffeeScript files.
It generates a watcher script to scan these files and generate HTML and JS.

## Installation

Or install with:

    $ gem install chrome_extension_scaffold

## Usage

    $ chrome_extension_scaffold my_extension_name
    $ cd my_extension_name
    $ ./watcher

* Open Chrome or Chromium
* Go to the Extensions panel
* Activate the developper mode
* Click "Add an unpacked extension" and select the created directory
* Your extension is loaded. Edit the files and hit "Reload".

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
