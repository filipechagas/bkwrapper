#require "aws-sdk"
#s3 = Aws::S3::Client.new
#resp = s3.list_buckets
#puts resp.buckets.map(&:name)


require_relative "lib/backup_executor"
require_relative "lib/pg_backupper"

backupper = PgBackupper.new("test", "filipechagas", "", "quez-new_development")
backup_executor = BackupExecutor.new(backupper)

backup_executor.generate_backup
