module Bkwrapper
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
          system_execute @backupper.backup_command
        rescue
          raise "Error generating backup file"
        end

        def generate_compressed_file
          system_execute @backupper.compress_command
        rescue
          raise "Error generating zip file"
        end

        def remove_backup_file
          system_execute "rm /var/tmp/#{@backupper.backup_filename}"
        end

        def system_execute command
          result = system command
          raise "Command returned an error" unless result
        end

    end
  end
end
