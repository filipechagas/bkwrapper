require "bkwrapper/backup/backup_executor"
require "bkwrapper/backup/pg_backupper"
require "bkwrapper/s3/uploader"

module Bkwrapper
  class Base
    def initialize(project_name)
      @project_name = project_name
    end

    def pg(db_username, db_password, db_name)
      @backupper = Bkwrapper::Backup::PgBackupper.new(@project_name, db_username, db_password, db_name)

      self
    end

    def mysql(db_username, db_password, db_name)
      @backupper = Bkwrapper::Backup::MysqlBackupper.new(@project_name, db_username, db_password, db_name)

      self
    end

    def backup_and_send_to_s3(access_key_id, secret_access_key, bucket_name)
      uploader = Bkwrapper::S3::Uploader.new access_key_id, secret_access_key, bucket_name, @project_name
      backup_executor = Bkwrapper::Backup::BackupExecutor.new(@backupper)

      backup_filename = backup_executor.generate_backup

      backup_filename = "/var/tmp/#{backup_filename}"

      uploader.upload_file backup_filename
    end

  end
end
