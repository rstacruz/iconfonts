Dev notes
=========

* to update iconsets, update `src/icons.json`.
* to add iconsets, just add the file in `src/`.
* `stylesheets/*` are generated from source files.

Rebuilding
----------

    make -B

(`-B` is essentially to force regenerations - not usually needed but its a good idea.)

Testing
-------

    make test

Be sure to install Sass first (`gem install sass`).

Updating icon sets
------------------

Update `src/your_icon_set.json`. To help you with this, gather its .css file and 
use the cssparse.js helper.

    # download the css
    $ wget https://raw.githubusercontent.com/zurb/foundation-icons/master/foundation_icons_general/stylesheets/general_foundicons.css -O foundicons.css

    # generate a json file from it
    $ node support/cssparse.js < foundicons.css > temp.json

    # ...now use temp.json to paste new icons into src/your_icon_set.json

Once you've updated the json files, use `make -B`.

Adding icon sets
----------------

Create `src/your_icon_set.json` by copying an existing `.json` file into your
new set. Follow the instructions above.


