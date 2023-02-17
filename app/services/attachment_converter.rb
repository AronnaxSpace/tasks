class AttachmentConverter
  def initialize(attachment)
    @attachment = attachment
  end

  def call
    return unless @attachment.content_type.start_with? 'image/'

    path = @attachment.tempfile.path
    image = ImageProcessing::Vips.source(path)
    converted_attachment = image.resize_to_limit!(500, 500)
    @attachment.tempfile = converted_attachment
  end
end
