require 'test_helper'

class TranslateTest < ActiveSupport::TestCase

  test "convert fgdc to iso19115_3" do
    @translate = translates(:fgdc_to_iso)
    @file = File.read( File.expand_path("../../fixtures/" + @translate.file, __FILE__) )
    @reader = @translate.reader
    @writer = @translate.writer

    @mdReturn = ADIWG::Mdtranslator.translate(
          file: @file, reader: @reader, writer: @writer)

    assert_not_nil(@mdReturn[:writerOutput])

  end

end
