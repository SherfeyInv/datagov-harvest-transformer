# frozen_string_literal: true

require 'test_helper'

class TranslatesControllerTest < ActionDispatch::IntegrationTest
  test 'post valid transformation of sbJson to mdJson' do
    @translate = translates(:sbjson_to_mdjson)
    @file =
      File.read(
        File.join(File.dirname(__FILE__), "../fixtures/#{@translate.file}")
      )
    post '/translates',
         params: {
           file: @file,
           reader: @translate.reader,
           writer: @translate.writer
         },
         as: :json
    assert_response 200
  end

  test 'post invalid transformation of fgdc to iso19115_3' do
    @translate = translates(:fgdc_to_iso)
    @file =
      File.read(
        File.join(File.dirname(__FILE__), "../fixtures/#{@translate.file}")
      )
    post '/translates',
         params: {
           file: @file,
           reader: @translate.reader,
           writer: @translate.writer
         },
         as: :json
    assert_response 422
  end
end
