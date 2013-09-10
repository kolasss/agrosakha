class Sell < ActiveRecord::Base
  belongs_to :city
  belongs_to :region
  belongs_to :category
  belongs_to :subcategory
  belongs_to :user
  belongs_to :count_type

  attr_accessible :image, :body, :count, :count_type_id, :price, :price_type, :title, :city_id, :region_id, :category_id, :subcategory_id
  attr_accessor :type

  validates :title, :presence => true, :length => { :maximum => 100 }
  validates :body, :length => { :maximum => 3000 }
  validates :category_id, :presence => true
  validates :count, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :count_type_id, :presence => true
  validates :price, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }

  self.per_page = 20

  default_scope order('updated_at DESC')

  has_attached_file :image, 
    :styles => {
      :thumb => {:geometry => "100x100>"},
      :large => {:geometry => "500x500>"}
    }

  validates_attachment :image,
    :content_type => { :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/jpg'] },
    :size => { :in => 10..300.kilobytes }


  #parse from google analytics
  def self.update_from_ga
    config = YAML.load_file(Rails.root.join("config/google_analytics.yml"))[Rails.env].symbolize_keys
    Garb::Session.login(config[:email], config[:password])
    profile = Garb::Management::Profile.all.detect { |p| p.web_property_id == config[:ua] }
    raise "missing profile #{config[:ua]} in #{Garb::Management::Profile.all.map(&:web_property_id)}" unless profile

    report = GoogleAnalyticsPageviews.results(profile, {
      :start_date => 1.month.ago, 
      :end_date => Date.today, 
      :filters => {:page_path.contains => '\/(sells|buys)\/'}, 
      :sort => [:pageviews, :uniquePageviews]
    })

    report.each do |rep|
      model = /^\/(?<type>[a-z-]+)\/(?<id>\d+)$/.match(rep.page_path)
      if model && (model[:type] == "sells" || model[:type] == "buys")
        GaPageviewsRecord.create!({
          :model_type => model[:type],
          :model_id => model[:id],
          :pageviews => rep.pageviews,
          :unique_pageviews => rep.unique_pageviews,
        })
      end
    end
  end

end
