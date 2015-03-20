module Backup
  class BackupExecutor
    def initialize(backupper)
      @backupper = backupper
    end

    def generate_backup
      generate_backup_file
      generate_compressed_file
      remove_backup_file

      @backupper.compressed_filename
    end

    private
      def generate_backup_file
        system @backupper.backup_command
      end

      def generate_compressed_file
        system @backupper.compress_command
      end

      def remove_backup_file
        system "rm #{@backupper.backup_filename}"
      end
  end
end
