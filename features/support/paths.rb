module NavigationHelpers
  module Refinery
    module Banners
      def path_to(page_name)
        case page_name
        when /the list of banners/
          admin_banners_path

         when /the new banner form/
          new_admin_banner_path
        else
          nil
        end
      end
    end
  end
end
