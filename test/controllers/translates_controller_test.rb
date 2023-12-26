# frozen_string_literal: true

require 'test_helper'

class TranslatesControllerTest < ActionDispatch::IntegrationTest
  test 'post transformation of fgdc to iso19115_3' do
    @translate = translates(:fgdc_to_iso)
    @file = File.read(File.expand_path("../../fixtures/#{@translate.file}", __FILE__))
    post '/translates', params: { translate: { file: @file,
                                               reader: @translate.reader, writer: @translate.writer } }, as: :json
    assert_response 200
  end
end
