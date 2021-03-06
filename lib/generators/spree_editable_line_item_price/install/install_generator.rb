module SpreeEditableLineItemPrice
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def add_javascripts
        append_file "app/assets/javascripts/frontend/all.js", "//= require store/spree_editable_line_item_price\n"
        append_file "app/assets/javascripts/backend/all.js", "//= require admin/spree_editable_line_item_price\n"
      end

      def add_stylesheets
        inject_into_file "app/assets/stylesheets/frontend/all.css", " *= require store/spree_editable_line_item_price\n", :before => /\*\//, :verbose => true
        inject_into_file "app/assets/stylesheets/backend/all.css", " *= require admin/spree_editable_line_item_price\n", :before => /\*\//, :verbose => true
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_editable_line_item_price'
      end

      def run_migrations
         res = ask "Would you like to run the migrations now? [Y/n]"
         if res == "" || res.downcase == "y"
           run 'bundle exec rake db:migrate'
         else
           puts "Skiping rake db:migrate, don't forget to run it!"
         end
      end
    end
  end
end
