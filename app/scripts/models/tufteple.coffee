'use strict';

class yeomanbackbone.Models.Tufteple extends Backbone.Model
  defaults:
    name: 'Hello world'
    foo: ()->{ } # because i'm dumb at callbacks
    _dataset: []


  initialize: ->
    this._datainput = @get("data")
    @convertDataInput(@_datainput) # sets @_dataset

  dataset: ->
    @get '_dataset'

  convertDataInput: (dataval) ->
    if _.isArray(dataval)
      @set('_dataset', dataval)
    else
      @loadDataFile(dataval, @_dataset)

  loadDataFile: (fname, a) ->

    d3.csv fname, (err, rows) =>
      @set('_dataset', rows)
      @get('foo')()


  pivot: (key) ->
  # make
    key
