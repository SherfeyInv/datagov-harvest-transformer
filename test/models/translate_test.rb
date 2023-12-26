# frozen_string_literal: true

require 'test_helper'

class TranslateTest < ActiveSupport::TestCase
  test 'convert fgdc to iso19115_3' do
    @translate = translates(:fgdc_to_iso)
    @file = File.read(File.expand_path("../../fixtures/#{@translate.file}", __FILE__))
    @reader = @translate.reader
    @writer = @translate.writer

    @md_return = ADIWG::Mdtranslator.translate(
      file: @file, reader: @reader, writer: @writer
    )

    assert_not_nil(@md_return[:writerOutput])
  end
end
