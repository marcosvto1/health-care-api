module FilesAttachable
  extend ActiveSupport::Concern
  include Rails.application.routes.url_helpers

  included do
    has_many_attached :files

    def files_url
      self.files.map { |f| rails_blob_url(f) }
    end
  end
end
