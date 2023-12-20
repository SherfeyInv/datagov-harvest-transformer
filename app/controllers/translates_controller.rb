class TranslatesController < ApplicationController

  # POST /translates
  def create

    # reader:string writer:string format:string 
    fileObj = params[:file]
    readerName = params[:reader]
    writerName = params[:writer]

    @mdReturn = ADIWG::Mdtranslator.translate(
        file: fileObj, reader: readerName, writer: writerName)

    @responseInfo = {}
    @responseInfo[:success] = true
    @responseInfo[:readerStructureStatus] = 'OK'
    @responseInfo[:readerStructureMessages] = @mdReturn[:readerStructureMessages]
    @responseInfo[:readerValidationStatus] = 'OK'
    @responseInfo[:readerValidationMessages] = @mdReturn[:readerValidationMessages]
    @responseInfo[:readerExecutionStatus] = 'OK'
    @responseInfo[:readerExecutionMessages] = @mdReturn[:readerExecutionMessages]
    @responseInfo[:writerStatus] = 'OK'
    @responseInfo[:writerMessages] = @mdReturn[:writerMessages]
    @responseInfo[:readerRequested] = @mdReturn[:readerRequested]
    @responseInfo[:readerVersionRequested] = @mdReturn[:readerVersionRequested]
    @responseInfo[:readerVersionUsed] = @mdReturn[:readerVersionUsed]
    @responseInfo[:writerRequested] = @mdReturn[:writerRequested]
    @responseInfo[:writerVersion] = @mdReturn[:writerVersion]
    @responseInfo[:writerOutputFormat] = @mdReturn[:writerOutputFormat]
    @responseInfo[:writerForceValid] = @mdReturn[:writerForceValid]
    @responseInfo[:writerShowTags] = @mdReturn[:writerShowTags]
    @responseInfo[:writerCSSlink] = @mdReturn[:writerCSSlink]
    @responseInfo[:writerMissingIdCount] = @mdReturn[:writerMissingIdCount]
    @responseInfo[:translatorVersion] = @mdReturn[:translatorVersion]
    @responseInfo[:writerOutput] = @mdReturn[:writerOutput]

    # set messages Status (ERROR, WARNING, NOTICE, none)
    aSMess = @responseInfo[:readerStructureMessages]
    aVMess = @responseInfo[:readerValidationMessages]
    aEMess = @responseInfo[:readerExecutionMessages]
    aWMess = @responseInfo[:writerMessages]

    status = 'OK'
    status = 'NOTICE' if aSMess.any? {|s| s.include?('NOTICE')}
    status = 'WARNING' if aSMess.any? {|s| s.include?('WARNING')}
    status = 'ERROR' if aSMess.any? {|s| s.include?('ERROR')}
    @responseInfo[:readerStructureStatus] = status

    status = 'OK'
    status = 'NOTICE' if aVMess.any? {|s| s.include?('NOTICE')}
    status = 'WARNING' if aVMess.any? {|s| s.include?('WARNING')}
    status = 'ERROR' if aVMess.any? {|s| s.include?('ERROR')}
    @responseInfo[:readerValidationStatus] = status

    status = 'OK'
    status = 'NOTICE' if aEMess.any? {|s| s.include?('NOTICE')}
    status = 'WARNING' if aEMess.any? {|s| s.include?('WARNING')}
    status = 'ERROR' if aEMess.any? {|s| s.include?('ERROR')}
    @responseInfo[:readerExecutionStatus] = status

    status = 'OK'
    status = 'NOTICE' if aWMess.any? {|s| s.include?('NOTICE')}
    status = 'WARNING' if aWMess.any? {|s| s.include?('WARNING')}
    status = 'ERROR' if aWMess.any? {|s| s.include?('ERROR')}
    @responseInfo[:writerStatus] = status

    # check for errors returned by parser, validator, reader, and writer
    @responseInfo[:success] = false unless @mdReturn[:readerStructurePass]
    @responseInfo[:success] = false unless @mdReturn[:readerValidationPass]
    @responseInfo[:success] = false unless @mdReturn[:readerExecutionPass]
    @responseInfo[:success] = false unless @mdReturn[:writerPass]

    render json: @responseInfo

  end
end
