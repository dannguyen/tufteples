# global beforeEach, describe, it, assert, expect
"use strict"

describe 'Tufteple Model', ->
  beforeEach ->
    @subject = yeomanbackbone.Models.Tufteple
    @tufteple = new @subject({data: [{x: 1, y: 2, name: 'Bob'}] });

  it 'should be good', ->
    assert.equal 3, 3

  describe 'defaults', ->
    it 'has name of Hello', ->
      expect(@tufteple.get('name')).to.equal 'Hello world'


  describe 'initialization options', ->
    describe ':data', ->

      describe 'when Array is passed in', ->
        it 'is all good', ->
          _data = [{x: 1, y: 2, name: 'Bob'}]
          t = new @subject({data: _data});
          expect( t.dataset() ).to.equal _data

      describe 'when String is passed in', ->
        beforeEach (done) ->
          @csv = 'data/cars.csv'
          @t = new @subject({data: @csv, foo: done })

        it 'is treated as a filename', ->

          expect(@t.dataset().length ).to.equal 6
