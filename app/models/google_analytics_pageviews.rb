class GoogleAnalyticsPageviews
  extend Garb::Model
  metrics :pageviews, :unique_pageviews
  dimensions :page_path
end