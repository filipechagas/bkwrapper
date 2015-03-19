require 'minitest/autorun'
require 'minitest/mock'
require_relative "../lib/backup_executor"

BackupExecutor.class_eval do
  private
    def system command
      nil
    end
end

describe BackupExecutor do
  let(:backupper) { Minitest::Mock.new }
  let(:backup_executor) { BackupExecutor.new backupper }

  before do
    backupper.expect :compressed_filename, "compressed_filename"
    backupper.expect :backup_command, "backup_command"
    backupper.expect :compress_command, "compress_command"
    backupper.expect :backup_filename, "backup_filename"
  end

  it 'should execute the correct chain of commands' do
    backup_executor.generate_backup.must_equal "compressed_filename"
    backupper.verify
  end
end
