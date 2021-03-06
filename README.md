[![CircleCI](https://circleci.com/gh/Medabots/medarot1/tree/master.svg?style=svg)](https://app.circleci.com/pipelines/github/Medabots/medarot1?branch=master)

[Medapedia page](http://medarot.meowcorp.us/wiki/Medapedia:Medarot_1_Translation_Project) (source reference for a lot of text and information)

# Building

## Dependencies

* Medarot 1 KABUTO ROM v1.1 (md5: 78c568cbfff6314b1416880d9efaeca6) and/or Medarot 1 KUWAGATA ROM v1.1 (md5: a9c9d6b6759c28f2b3986717f4df2f98)
	* Currently relies on the rgbds overlay feature as parts are disassembled and tacked on
* Make
* Python 3.6 or greater, aliased to 'python3'
* [rgbds](https://github.com/rednex/rgbds)

# Make

1. Name the Medarot 1 KABUTO v1.1 ROM 'baserom_kabuto.gb' and drop it in the project root
1. Execute make (optionally pass -j)
	* The master branch will execute cmp to verify the output matches the original
	* Pass 'kabuto' or 'kuwagata' to build a specific version

# Dumping

Execute 'make dump' (nothing should change, as the text files are checked in)
