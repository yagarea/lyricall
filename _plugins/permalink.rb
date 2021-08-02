require 'active_support/core_ext/string/inflections'

module Jekyll
  class CustomPermalink < Jekyll::Generator
    safe true
    priority :low

    def generate(site)
      # nothing to do, wait for hook
    end

    Jekyll::Hooks.register :documents, :pre_render do |doc|
      begin
        # check if jekyll can resolve the url template
        doc.url
      rescue NoMethodError => error
        begin
          if !doc.collection.metadata.fetch("custom_permalink_placeholders").is_a?(Array)
            raise CustomPermalinkSetupError, "The custom placeholders need to be an array! Check the settings of your '#{doc.collection.label}' collection."
          end
          def doc.url_template
            @custom_url_template ||= collection.metadata.fetch("custom_permalink_placeholders").inject(collection.url_template){|o,m| o.sub ":" + m, data[m].to_s.parameterize}
          end
        rescue KeyError
          # "custom_permalink_placeholders"
          raise CustomPermalinkSetupError, "No custom placeholders defined for the '#{doc.collection.label}' collection. Define an array of placeholders under the key 'custom_permalink_placeholders'. \nCaused by: " + error.to_s
        end
      end
    end
  end
end

