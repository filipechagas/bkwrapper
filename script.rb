require_relative "lib/backup/backup_executor"
require_relative "lib/backup/pg_backupper"
require_relative "lib/s3/uploader"

backupper = Backup::PgBackupper.new("test", "filipechagas", "", "quez-new_development")
backup_executor = Backup::BackupExecutor.new(backupper)
uploader = S3::Uploader.new "AKIAILK47MBEBB5VRAQQ", "CPwVuqn63ZNzsmzUgBg2xewJ6tpwjibaDA3ahhjN"

backup_filename = backup_executor.generate_backup
backup_filename = File.expand_path("../#{backup_filename}", __FILE__)

uploader.upload_file backup_filename

Dir.glob('./*.zip').each { |f| File.delete(f) }
