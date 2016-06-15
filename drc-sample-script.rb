# To use local gem:
# $LOAD_PATH.unshift('[PATH]/dspace-rest-client/lib')

require 'dspace'

client = Dspace::Client.new(dspace_api: 'https://demo.dspace.org/')
if !client.is_running?
  raise 'Can\'t connect to DSpace API.'
end

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
