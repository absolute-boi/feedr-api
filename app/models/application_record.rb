class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private

  def make_slug
    name.parameterize
  end
end
