# encoding: UTF-8

class WpItem
  module Output

    # @return [ Void ]
    def output(verbose = false)
      puts
      puts "<wpitem category=\"info\" data=\"Name: #{self}\">" #this will also output the version number if detected
      puts "<location data=\"Location: #{url}\"></location>"
      #puts " | WordPress: #{wordpress_url}" if wordpress_org_item?
      puts "<readme data=\"Readme: #{readme_url} \"></readme>" if has_readme?
      puts "<changelog data=\"Changelog: #{changelog_url}\"></changelog>" if has_changelog?
      puts "<directorylisting category=\"warning\" data=\"Directory listing is enabled: #{url}\"></directorylisting>" if has_directory_listing?
      puts "<errorlog category=\"warning\" data=\"An error_log file has been found: #{error_log_url}\"></errorlog>" if has_error_log?

      additional_output(verbose) if respond_to?(:additional_output)

      if version.nil? && vulnerabilities.length > 0
        puts
        puts "<noversion category=\"warning\" data=\"We could not determine a version so all vulnerabilities are printed out\"></noversion>"
      end

      vulnerabilities.output
      puts "</wpitem>"
    end
  end
end
