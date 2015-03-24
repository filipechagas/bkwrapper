require_relative "compressor"

module Backup
  class MysqlBackupper
    include Compressor

    attr_reader :project_name, :db_username, :db_password, :db_name

    def initialize(project_name, db_username, db_password, db_name)
      @project_name, @db_username, @db_password, @db_name =
        project_name, db_username, db_password, db_name
    end

    def backup_command
      "mysqldump -u#{db_username} -p#{db_password} #{db_name} > #{backup_filename}"
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
