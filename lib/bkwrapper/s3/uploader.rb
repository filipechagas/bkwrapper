require "aws-sdk"
module Bkwrapper
  module S3
    class Uploader
      def initialize(access_key_id, secret_access_key, bucket_name, project_name)
        @bucket_name, @project_name = bucket_name, project_name

        creds = ::Aws::Credentials.new(access_key_id, secret_access_key)
        @s3 = ::Aws::S3::Client.new(credentials: creds, region:'us-east-1')
      end

      def upload_file(filename)
        file_open = File.open(filename)
        @s3.put_object(body: file_open, bucket: "#{@bucket_name}/#{@project_name}", key: File.basename(filename))
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
end
