module Backup
  module Compressor
    def compress_command
      "zip #{compressed_filename} #{backup_filename}"
    end

    def compressed_filename
      "#{backup_filename}.zip"
    end
  end
end
