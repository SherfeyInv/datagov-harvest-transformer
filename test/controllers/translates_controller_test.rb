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
    assert_response :ok
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
    assert_response :unprocessable_entity
  end

  test 'post valid transformation of iso19115_2_datagov to dcat_us' do
    @translate = translates(:valid_iso19115_2_datagov_to_dcatus)
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
    assert_response :ok
  end

  test 'post invalid transformation of iso19115_2_datagov to dcat_us' do
    @translate = translates(:invalid_iso19115_2_datagov_to_dcatus)
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
    assert_response :unprocessable_entity
  end
end
