require 'rubygems'
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'

module Professor
  class Driver
    include Capybara::DSL

    def initialize
      Capybara.register_driver :poltergeist do |app|
        Capybara::Poltergeist::Driver.new(app, {
          js_errors: false
        })
      end

      Capybara.run_server = false
      Capybara.default_driver = :poltergeist
      Capybara.app_host = 'https://www.coursera.org/'
    end

    def go_to_homepage
      visit('/')
    end

    def click_login_link
      find('[data-track-href="https://www.coursera.org/?authMode=login"]').click
    end

    def fill_login_form
      find('#user-modal-email').set(ENV['COURSERA_USERNAME'])
      find('#user-modal-password').set(ENV['COURSERA_PASSWORD'])
    end

    def submit_login_form
      find('[data-courselenium="login-form-submit-button"]').click

      # Todo: This should be wait_until
      sleep(5)
    end
  end
end

professor = Professor::Driver.new

professor.go_to_homepage
professor.click_login_link
professor.fill_login_form
professor.submit_login_form