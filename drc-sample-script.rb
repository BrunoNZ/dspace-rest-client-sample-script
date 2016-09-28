# To use local gem:
$LOAD_PATH.unshift('/home/bruno/Projetos/dspace-rest-client/bnzanette/lib')

require 'dspace'

list_all=true
create_community=false
create_collection=false
create_item=false

# ============================================================================ #
# Create Dspace Client
client = Dspace::Client.new(dspace_api: 'https://demo.dspace.org')
if !client.is_running?
  raise 'Can\'t connect to DSpace API.'
end

# Login on Dspace
client.login 'dspacedemo+admin@gmail.com', 'dspace'
# ============================================================================ #

if list_all
# ============================================================================ #
# List all COMMUNITIES/COLLECTIONS/ITEMS

# GET ALL COMMUNITIES
client.communities.all.each do |community|
  puts "-> #{community.name}"

  # GET ALL COMMUNITIES's COLLECTIONS
  client.communities.collections(:id => community.id).each do |collection|
    puts "\t->#{collection.name}"

    # GET ALL COLLECTIONS's ITEMS
    client.collections.items(:id => collection.id, limit: 10, offset: 0, expand: "metadata").each do |item|
      puts "\t\t->#{item.name}"

      # GET ALL ITEMS's BITSTREAMS
      client.items.bitstreams(:id => item.id).each do |bitstream|
        puts "\t\t\t->#{bitstream.name}"

      end
    end
  end
end
# ============================================================================ #
end

if create_community
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
end

if create_collection
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
end

if create_item
# ============================================================================ #
# Create ITEM
item_metadata = Dspace::Item.new(
  'metadata' => [
    {'key' => "dc.title", 'value' => "Item Created by dspace-rest-client"},
    {'key' => "dc.description", 'value' => "Description for this awesome item!"}
  ]
)

item = client.collections.create_item(item_metadata, id: collection.id)
file = File.new('logo-c3sl.png', 'r')
client.items.add_bitstream(
  file,
  id: item.id,
  name: "logo-c3sl.png",
  description: "Description for this awesome bitstream"
)

puts "Created item!\n#{item.inspect}\n"

# Get ITEM's METADATA
item = client.items.find(id: item.id, expand: "bitstreams,metadata")
puts "| metadata:"
item.metadata.each do |m|
  puts "\t| #{m.key} => #{m.value}"
end
puts "| bitstreams:"
unless item.bit_streams.nil?
  item.bit_streams.each do |b|
    puts "\t| name => #{b.name}"
  end
end
# ============================================================================ #
end
