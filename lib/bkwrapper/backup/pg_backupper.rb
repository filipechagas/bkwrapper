require "bkwrapper/backup/compressor"

module Bkwrapper
  module Backup
    class PgBackupper
      include Compressor

      attr_reader :project_name, :db_username, :db_password, :db_name

      def initialize(project_name, db_username, db_password, db_name)
        @project_name, @db_username, @db_password, @db_name =
          project_name, db_username, db_password, db_name
      end

      def backup_command
        "PGPASSWORD=#{db_password} pg_dump -U #{db_username} -Fc #{db_name} > /var/tmp/#{backup_filename}"
      end

      def backup_filename
        "#{prefix}-#{project_name}#{suffix}"
      end

      private
        def prefix
          @date_prefix ||= Time.now.strftime("%Y-%m-%d-%H-%M-%S")
        end

        def suffix
          ".backup"
        end
    end
  end
end
