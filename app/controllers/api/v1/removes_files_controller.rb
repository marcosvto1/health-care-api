module Api
    module V1
        class RemovesFilesController < ApiController
            def destroy
                id = params[:id]
                @file = ActiveStorage::Attachment.find(id)
                @file.purge

                render json: { ok: "File deleted"}
            end
        end
    end
end