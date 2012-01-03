module Refinery
  module Banners
    module Extensions
      module Page
        module ClassMethods
          def add_banners_relationship
            has_and_belongs_to_many :banners
          end
        end

        def self.included(base)
          base.extend(ClassMethods).add_banners_relationship
        end
      end
    end
  end
end