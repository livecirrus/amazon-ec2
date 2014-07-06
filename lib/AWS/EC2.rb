module AWS
  module EC2

    # Which host FQDN will we connect to for all API calls to AWS?
    # If EC2_URL is defined in the users ENV we can override the default with that.
    #
    # @example
    #   export EC2_URL='https://ec2.amazonaws.com'
    if ENV['EC2_URL']
      EC2_URL = ENV['EC2_URL']
      DEFAULT_HOST = URI.parse(EC2_URL).host
    else
      # Default US API endpoint
      DEFAULT_HOST = 'ec2.amazonaws.com'
    end

    API_VERSION = '2010-08-31'

    class Base < AWS::Base
      def api_version
        API_VERSION
      end

      def default_host
        DEFAULT_HOST
      end

      def valid_instance_types
        ["t1.micro", "t2.micro", "t2.small", "t2.medium", "m1.small", "m1.large", "m1.xlarge", "m2.xlarge", "m3.medium", "m3.large", "m3.xlarge", "m3.2xlarge", "c1.medium", "c1.xlarge", "c3.large", "c3.xlarge", "c3.2xlarge", "c3.4xlarge", "c3.8xlarge", "m2.2xlarge", "m2.4xlarge", "cc1.4xlarge", "r3.large", "r3.xlarge", "r3.2xlarge", "r3.4xlarge", "r3.8xlarge"]
      end

    end

  end
end

