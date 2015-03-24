#s3 = Aws::S3::Client.new
#resp = s3.list_buckets
#puts resp.buckets.map(&:name)

require "aws-sdk"
module S3
  class Uploader
    def initialize(access_key_id, secret_access_key)
      creds = ::Aws::Credentials.new(access_key_id, secret_access_key)
      @s3 = ::Aws::S3::Client.new(credentials: creds, region:'us-east-1')
    end

    def upload_file(filename)
      file_open = File.open(filename)
      @s3.put_object(body: file_open, bucket: "quez-database-backups", key: File.basename(filename))
    end

    def buckets_names
      @s3.list_buckets.buckets.map(&:name)
    end

    def create_bucket(bucket_name)
      @s3.create_bucket bucket: bucket_name
    end

    def delete_bucket(bucket_name)
      @s3.delete_bucket bucket: bucket_name
    end
  end
end
