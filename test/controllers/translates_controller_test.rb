require 'test_helper'

class TranslatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @translate = translates(:one)
  end

  test "should get index" do
    get translates_url, as: :json
    assert_response :success
  end

  test "should create translate" do
    assert_difference('Translate.count') do
      post translates_url, params: { translate: { format: @translate.format, reader: @translate.reader, writer: @translate.writer } }, as: :json
    end

    assert_response 201
  end

  test "should show translate" do
    get translate_url(@translate), as: :json
    assert_response :success
  end

  test "should update translate" do
    patch translate_url(@translate), params: { translate: { format: @translate.format, reader: @translate.reader, writer: @translate.writer } }, as: :json
    assert_response 200
  end

  test "should destroy translate" do
    assert_difference('Translate.count', -1) do
      delete translate_url(@translate), as: :json
    end

    assert_response 204
  end
end
