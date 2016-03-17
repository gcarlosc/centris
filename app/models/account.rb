class Account < ActiveRecord::Base
  after_create :create_tenant

  validates :organization_name, presence: true
  validates :web, presence: true, format: { with: %r{https?:\/\/[\S]+\.[\S]+\.[\S]} }
  validates :subdomain, presence: true, uniqueness: true
  validates_format_of :subdomain, :with => /^[a-z\d]+(-[a-z\d]+)*$/i, multiline: true


  def web=(value)
    if value.blank? || value =~ %r{^http(s)?://}
      super
    else
      new_value = "http://#{value}"
      super(new_value)
    end
  end

  private

  def create_tenant
    Apartment::Tenant.create(subdomain)
  end
end
