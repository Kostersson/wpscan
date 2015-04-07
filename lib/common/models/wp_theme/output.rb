# encoding: UTF-8

class WpTheme
  module Output

    # @return [ Void ]
    def additional_output(verbose = false)
      parse_style
      
      theme_desc = verbose ? @theme_description : truncate(@theme_description, 100)
      puts "<style data=\"Style URL: #{style_url}\"></style>"
      puts "<referencedstyle data=\"Referenced style.css: #{referenced_url}\"></referencedstyle>" if referenced_url && referenced_url != style_url
      puts "<themename data=\"Theme Name: #@theme_name\"></themename>" if @theme_name
      puts "<theme data=\"Theme URI: #@theme_uri\"></theme>" if @theme_uri
      puts "<description data=\"Description: #{theme_desc}\"></description>"
      puts "<author data=\"Author: #@theme_author\"></author>" if @theme_author
      puts "<authoruri data=\"Author URI: #@theme_author_uri\"></authoruri>" if @theme_author_uri
      puts "<template data=\"Template: #@theme_template\"></template>" if @theme_template and verbose
      puts "<licence data=\"License: #@theme_license\"></licence>" if @theme_license and verbose
      puts "<licenceuri data=\"License URI: #@theme_license_uri\"></licenceuri>" if @theme_license_uri and verbose
      puts "<tags data=\"Tags: #@theme_tags\"></tags>" if @theme_tags and verbose
      puts "<textdomain data=\"Text Domain: #@theme_text_domain\"></textdomain>" if @theme_text_domain and verbose
    end

  end
end
