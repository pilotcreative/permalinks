require File.dirname(__FILE__) + '/test_helper'

class CountryTest < Test::Unit::TestCase
  context "Country model" do
    setup do
      @country = Country.new :name => "United Kingdom"
      @country.save!
    end
    subject { @country }

    context "regular country name" do
      should "return permalink" do
        assert_equal "#{@country.id}-united-kingdom", @country.to_param
      end
    end

    context "country name with a lot of white spaces" do
      should "return permalink" do
        @country.name = "United    Kingdom   "
        @country.save!
        assert_equal "#{@country.id}-united-kingdom", @country.to_param
      end
    end

    context "country with id equal nil" do
      should "return permalink" do
        @country.name = "2-tratata"
        @country.id = nil
        @country.save!
        assert_equal "#{@country.id}-2-tratata", @country.to_param
      end
    end

    context "country name with capital letters" do
      should "return permalink" do
        @country.name = " USA "
        @country.save!
        assert_equal "#{@country.id}-usa", @country.to_param
      end
    end
  end
end

class PostTest < Test::Unit::TestCase
  context "Post model" do
    setup do
      @post = Post.new :title => "Something cool"
      @post.save!
    end
    subject { @post }

    context "regular post title" do
      should "return permalink" do
        assert_equal "#{@post.id}-something-cool", @post.to_param
      end
    end

    context "post title with a lot of white spaces" do
      should "return permalink" do
        @post.title = " Snow is     cold   "
        @post.save!
        assert_equal "#{@post.id}-snow-is-cold", @post.to_param
      end
    end

    context "post title with capital letters" do
      should "return permalink" do
        @post.title = " SOMETHING i really like to DO   is sleeping "
        @post.save!
        assert_equal "#{@post.id}-something-i-really-like-to-do-is-sleeping", @post.to_param
      end
    end
  end
end