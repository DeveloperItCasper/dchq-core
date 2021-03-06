class NoteDecorator < Draper::Decorator
  delegate_all

  def creator_name
    model.creator.full_name
  end

  def created_at
    l model.created_at, format: :default
  end

  def has_attachment?
    model.attachment && model.attachment.data.exists?
  end

  def attachment_url
    model.attachment.data.url
  end

  def file_name
    model.attachment.data_file_name if has_attachment?
  end
end
