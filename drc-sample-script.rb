# To use local gem:
# $LOAD_PATH.unshift('[PATH]/dspace-rest-client/lib')

require 'dspace'

# ============================================================================ #
# Create Dspace Client
client = Dspace::Client.new(dspace_api: 'https://demo.dspace.org/')
if !client.is_running?
  raise 'Can\'t connect to DSpace API.'
end

# Login on Dspace
client.login 'dspacedemo+admin@gmail.com', 'dspace'
# ============================================================================ #

# ============================================================================ #
# List all COMMUNITIES/COLLECTIONS/ITEMS

# GET ALL COMMUNITIES
client.communities.all.each do |community|
  puts "-> #{community.name}"

  # GET ALL COMMUNITIES's COLLECTIONS
  client.communities.collections(:id => community.id).each do |collection|
    puts "\t->#{collection.name}"

    # GET ALL COLLECTIONS's ITEMS
    client.collections.items(:id => collection.id).each do |item|
      puts "\t\t->#{item.name}"

      # GET ALL ITEMS's BITSTREAMS
      client.items.bitstreams(:id => item.id).each do |bitstream|
        puts "\t\t\t->#{bitstream.name}"

      end
    end
  end
end
# ============================================================================ #

# ============================================================================ #
# Create COMMUNITY
community = client.communities.create(
  Dspace::Community.new(
    {
      'name' => "Community Created by dspace-rest-client",
      'introductoryText' => "introductoryText for this awesome community!",
      'shortDescription' => "shortDescription for this awesome community!",
      'sidebarText' => "sidebarText for this awesome community!"
    }
  )
)
puts "Created community!\n#{community.inspect}\n"

# Update COMMUNITY
community.name = "Community Updated by dspace-rest-client"
if (client.communities.update(community, id: community.id))
  puts "Community successfully updated!"
end
# ============================================================================ #

# ============================================================================ #
# Create COLLECTION
collection = client.communities.create_collection(
  Dspace::Collection.new(
    {
      'name' => "Collection Created by dspace-rest-client",
      'introductoryText' => "introductoryText for this awesome collection!",
      'shortDescription' => "shortDescription for this awesome collection!",
      'sidebarText' => "sidebarText for this awesome collection!"
    }
  ),
  id: community.id
)

puts "Created collection!\n#{collection.inspect}\n"

# Update COMMUNITY
collection.name = "Collection Updated by dspace-rest-client"
if (client.collections.update(collection, id: collection.id))
  puts "Collection successfully updated!"
end
# ============================================================================ #
