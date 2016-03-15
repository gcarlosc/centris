class Account < ActiveRecord::Base
  after_create :create_tenant

  validates :organization_name, presence: true
  validates :web, presence: true
  validates :subdomain, presence: true, uniqueness: true
  validates_format_of :subdomain, :with => /^[a-z\d]+(-[a-z\d]+)*$/i, multiline: true

  private

  def create_tenant
    Apartment::Tenant.create(subdomain)
  end
end
