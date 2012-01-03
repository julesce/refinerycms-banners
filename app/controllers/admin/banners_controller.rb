module Admin
  class BannersController < Admin::BaseController

    crudify :banner,
            :title_attribute => 'name', :xhr_paging => true

  end
end
