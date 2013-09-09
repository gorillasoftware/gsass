require 'gsass/version'
require "fileutils"
require 'thor'

module Gsass
  class Generator < Thor
    map ['-v', '--version'] => :version

    desc 'install', 'Install Gsass into your project'
    method_options :path => :string, :force => :boolean
    def install
      if gsass_files_already_exist? && !options[:force]
        puts "Gsass files already installed, doing nothing."
      else
        install_files
        puts "Gsass files installed to #{install_path}/"
      end
    end

    desc 'update', 'Update Gsass'
    method_options :path => :string
    def update
      if gsass_files_already_exist?
        remove_gsass_directory
        install_files
        puts "Gsass files updated."
      else
        puts "No existing gsass installation. Doing nothing."
      end
    end

    desc 'version', 'Show Gsass version'
    def version
      say "Gsass #{Gsass::VERSION}"
    end

    private

    def gsass_files_already_exist?
      install_path.exist?
    end

    def install_path
      @install_path ||= if options[:path]
          Pathname.new(File.join(options[:path], 'gsass'))
        else
          Pathname.new('gsass')
        end
    end

    def install_files
      make_install_directory
      copy_in_scss_files
    end

    def remove_gsass_directory
      FileUtils.rm_rf("gsass")
    end

    def make_install_directory
      FileUtils.mkdir_p(install_path)
    end

    def copy_in_scss_files
      FileUtils.cp_r(all_stylesheets, install_path)
    end

    def all_stylesheets
      Dir["#{stylesheets_directory}/*"]
    end

    def stylesheets_directory
      File.join(top_level_directory, "app", "assets", "stylesheets")
    end

    def top_level_directory
      File.dirname(File.dirname(File.dirname(__FILE__)))
    end
  end
end
