# -*- coding: utf-8 -*-
require File.expand_path 'test_helper', File.dirname(__FILE__)

class WikiTest < MiniTest::Unit::TestCase
  def setup
    @wikiname = 'testtesttest'
    @wiki = Gyazz::Wiki.new(@wikiname)
  end

  def teardown
    cleanup
  end

  def cleanup
    system "/bin/rm -r -f #{@wiki.dir}"
  end

  def test_1
    assert File.exists?(@wiki.dir)
    assert File.ftype(@wiki.dir) == 'directory'
    assert @wiki.dir.index(FILEROOT) == 0
    cleanup
  end

  def test_pages
    page = Gyazz::Page.new(@wiki,'test1')
    page.write('abc')
    assert @wiki.pageids.length == 1
    page = Gyazz::Page.new(@wiki,'test2')
    page.write('abc')
    assert @wiki.pageids.length == 2
    page = Gyazz::Page.new(@wiki,'test1')
    page.write('def')
    assert @wiki.pageids.length == 2
    titles = @wiki.titles
    assert titles.member?('test1')
    assert titles.member?('test2')
    @wiki.pageids.each { |page|
      assert page =~ /^[\da-f]{32}$/
    }
    @wiki.pages.each { |page|
      assert page.class == Gyazz::Page
    }
  end
end