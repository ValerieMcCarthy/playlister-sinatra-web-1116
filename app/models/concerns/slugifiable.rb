module Slugger
  module ClassMethods
    def find_by_slug(slug)
      lower_name = slug.split("-").join(" ")
      self.where("lower(name) = ?", lower_name).first
    end
  end

  module InstanceMethods
    def slug
      name.downcase.split.join("-")
    end
  end
end
