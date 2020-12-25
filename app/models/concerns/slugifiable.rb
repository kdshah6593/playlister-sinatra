module Slugifiable
    module InstanceMethods
        #replaces all spaces or commas special characters with a -
        def slug
            self.name.downcase.gsub(" ", "-")
        end
    end

    module ClassMethods
        #uses the slug method to retrieve song/artist/genre from DB
        def find_by_slug(slug)
            self.all.detect {|x| x.slug == slug}
        end
    end
end