require 'aws-sdk-cloudwatch'
Aws.config.update({
  region: 'us-west-1',
  credentials: Aws::Credentials.new('AWS_KEY', 'AWS_SECRET')
})


def list_metrics_for_namespace(cloudwatch_client, metric_namespace)
  response = cloudwatch_client.list_metrics(namespace: metric_namespace)

  if response.metrics.count.positive?
    response.metrics.each do |metric|
      puts "  Metric name: #{metric.metric_name}"
      if metric.dimensions.count.positive?
        puts '    Dimensions:'
        metric.dimensions.each do |dimension|
          puts "      Name: #{dimension.name}, Value: #{dimension.value}"
        end
      else
        puts 'No dimensions found.'
      end
    end
  else
    puts "No metrics found for namespace '#{metric_namespace}'. " \
      'Note that it could take up to 15 minutes for recently-added metrics ' \
      'to become available.'
  end
end



metric_namespace = 'AWS/RDS'
region = 'us-east-1'

cloudwatch_client = Aws::CloudWatch::Client.new(region: region)

list_metrics_for_namespace(cloudwatch_client, metric_namespace)