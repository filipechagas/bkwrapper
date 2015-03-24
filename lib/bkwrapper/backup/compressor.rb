module Bkwrapper
  module Backup
    module Compressor
      def compress_command
        "zip /var/tmp/#{compressed_filename} /var/tmp/#{backup_filename}"
      end

      def compressed_filename
        "#{backup_filename}.zip"
      end
    end
  end
end
