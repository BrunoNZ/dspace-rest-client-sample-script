# To use local gem:
$LOAD_PATH.unshift('/home/bruno/Projetos/dspace-rest-client/bnzanette/lib')

require 'dspace'

# ============================================================================ #
# Create Dspace Client
client = Dspace::Client.new(dspace_api: 'https://demo.dspace.org')
if !client.is_running?
  raise 'Can\'t connect to DSpace API.'
end
# ============================================================================ #


site_original = JSON.parse('{"uuid":"51e00be2-b8f2-4adf-871f-1649a4a8ed58","name":"DSpace Demo Repository","handle":"10673/0","community":[{"uuid":"20ca1cb8-542d-435b-8996-fafc966da89b","name":"Administration and Finance","handle":"10673/59","community":[],"collection":[{"uuid":"44baeb28-3c3e-4479-ac1b-129399a1804a","name":"Information Communication and Technology","handle":"10673/60"}]},{"uuid":"df3cc2a9-65a0-4117-8306-541974e38dc7","name":"Bob Test","handle":"10673/53","community":[],"collection":[{"uuid":"7740c113-f0c1-4b76-bdec-32fcc9e23f01","name":"Bob Collection 1","handle":"10673/55"}]},{"uuuuid":"9504d5d3-5804-4ffa-a695-ac5dcea37161","name":"Communicable Diseases","handle":"10673/62","community":[],"collection":[{"uuid":"ff3376da-4ba9-4fef-af78-44b327391e94","name":"Admin Documents","handle":"10673/63"}]},{"uuid":"af898fa4-6c1e-459e-8836-b8bd2c4126af","name":"Foto","handle":"10673/51","community":[],"collection":[{"uuid":"e27d5c19-6ce8-49a0-aa2a-7db8de7f4e0d","name":"Podstawowa Ż","handle":"10673/52"}]},{"uuid":"08bc29f2-dfbf-4e9f-803c-397ef0e967ed","name":"Ingeniería en Software","handle":"10673/17","community":[],"collection":[]},{"uuid":"1bfa9704-9fb9-4a38-80a6-b4f36f864680","name":"Inst. Municipal Superior de Educación y Tecnología \"Emilio Fermín Mignone\"","handle":"10673/19","community":[{"uuid":"05050711-561a-499b-96ad-bb43b542c5b7","name":"GASTRONOMIA","handle":"10673/26","community":[{"uuid":"0209d1e3-ab65-4166-8cb0-50edf7752cdd","name":"Formación  de análisis en servicios de gastronomía","handle":"10673/32","community":[],"collection":[]},{"uuid":"b5d279c7-e459-42fb-b615-a3376eda372e","name":"cocina I","handle":"10673/34","community":[],"collection":[]},{"uuid":"0077678f-c898-4488-8c31-91dbbea0b559","name":"Panadería y pastelería","handle":"10673/35","community":[],"collection":[]},{"uuid":"1d781b8a-d1f9-4292-ad32-c91a88fa4bc0","name":"Frances","handle":"10673/36","community":[],"collection":[]},{"uuid":"fbaf85d4-48a5-49a7-96da-6e480c12e9b9","name":"Informatica","handle":"10673/37","community":[],"collection":[]},{"uuid":"e23bc4f9-9cf5-4eff-a0ac-667f2c6e9ba1","name":"Servicio de bar y restaurante","handle":"10673/38","community":[],"collection":[]}],"collection":[{"uuid":"04257756-0491-4c8b-afff-5e9a7f55b83e","name":"Untitled","handle":"10673/56"}]},{"uuid":"0eaef497-5267-4fc0-8454-8f55ea5439a9","name":"GESTION CULTURAL","handle":"10673/27","community":[{"uuid":"61245492-b047-4e0b-a340-280b56d7abd2","name":"Ingles I","handle":"10673/42","community":[],"collection":[]},{"uuid":"d1aba951-31bf-4640-bca5-d31cda415316","name":"Gestión y Administración de la Información","handle":"10673/43","community":[],"collection":[]},{"uuid":"2d29c433-60f0-4194-bd7a-97457bf64d6e","name":"Comunicación de las Organizaciones","handle":"10673/44","community":[],"collection":[]},{"uuid":"fe1b7fb1-705a-4a07-bf85-b2a7470b4c6d","name":"Estado y Sociedad","handle":"10673/45","community":[],"collection":[]},{"uuid":"348d6125-3f31-4314-adb6-7cbe7c255ebe","name":"Antropología Cultural","handle":"10673/46","community":[],"collection":[]}],"collection":[]},{"uuid":"73d0f585-3192-491a-87b9-f5b2edba8e47","name":"RELACIONES PUBLICAS RRPP","handle":"10673/28","community":[],"collection":[]},{"uuid":"7c38fee8-6a4f-400c-a93d-1a7e5ba05ab5","name":"BIBLIOTECOLOGIA","handle":"10673/29","community":[],"collection":[]},{"uuid":"5c1f9166-2734-4521-9f04-4ee0f592b81a","name":"PROFESORADO DE EDUCACION FISICA","handle":"10673/30","community":[],"collection":[]},{"uuid":"91ea56ca-efbb-494b-a01d-a88e0939f327","name":"INDUSTRIA TEXTIL E INDUMENTARIA","handle":"10673/31","community":[],"collection":[{"uuid":"23e085bf-4c89-487d-b6a4-466cb5d46e8d","name":"Matemática","handle":"10673/47"},{"uuid":"f7b9949c-8f7d-40c7-b1e2-426eaa829704","name":"Matemática","handle":"10673/48"},{"uuid":"6e321311-59a6-498a-aa69-e8d24a455ef2","name":"Dibujo","handle":"10673/49"}]}],"collection":[]},{"uuid":"e6b4525b-f057-4fa5-9946-5bdaade22d36","name":"Media and communications","handle":"10673/61","community":[],"collection":[{"uuid":"5539a631-5cf5-43d0-a6a1-ad33ae87ad25","name":"sunday special","handle":"10673/64"}]},{"uuid":"3f71a6d8-6d22-4142-984e-36bb59d0ce41","name":"OAI Harvest Test","handle":"10673/72","community":[],"collection":[]},{"uuid":"9e13bcff-214b-4e9d-b9c3-e4d03b5d3417","name":"Poliomyelitis","handle":"10673/57","community":[],"collection":[{"uuid":"27ab2b00-14d5-4fa1-b1ad-08160c6886ea","name":"Immunization","handle":"10673/58"}]},{"uuid":"8b7ca178-00e3-40b4-84d6-64b22792acd2","name":"Sample Community","handle":"10673/1","community":[],"collection":[{"uuid":"dd7c952d-0893-4c0e-a17b-1e2f7e93261a","name":"Collection of Sample Items","handle":"10673/2"},{"uuid":"e01c8dbf-c103-44ec-a574-7fc8eb98465f","name":"Collection with embargo feature enabled (use only with XMLUI)","handle":"10673/8"}]},{"uuid":"c8af8e19-3873-4e6c-92db-02d012e3f2bf","name":"SubCommTest_Top","handle":"10673/310","community":[{"uuid":"5ca14b71-98cb-4d65-999f-94e9897fb8bb","name":"SubCommTest_1","handle":"10673/311","community":[{"uuid":"38cb596d-bde4-4967-b5e5-ec4e8ea464cd","name":"SubCommTest_2","handle":"10673/312","community":[{"uuid":"3d6ce9d5-1ef9-4744-a2c3-2d5e8f01d9f0","name":"SubCommTest_3","handle":"10673/313","community":[],"collection":[]}],"collection":[]}],"collection":[]}],"collection":[]},{"uuid":"d7568789-5762-46be-9085-d64730a46f8f","name":"Zdjęcia","handle":"10673/50","community":[],"collection":[]}],"collection":[]}')

site = client.hierarchy.all

# ------------------------------------------------------- #
site_original['community'].each do |c|
  puts "1> #{c['name']}"
  c['collection'].each do |coll|
    puts "1> COLL: #{coll['name']}"
  end

  c['community'].each do |cc|
    puts "-- 2> #{cc['name']}"
    cc['collection'].each do |coll|
      puts "-- 2> COLL: #{coll['name']}"
    end

    cc['community'].each do |ccc|
      puts "---- 3> #{ccc['name']}"
      ccc['collection'].each do |coll|
        puts "---- 3> COLL: #{coll['name']}"
      end

      ccc['community'].each do |cccc|
        puts "------ 4> #{cccc['name']}"
        cccc['collection'].each do |coll|
          puts "------ 4> COLL: #{coll['name']}"
        end
      end
    end
  end
end
# ------------------------------------------------------- #

# ------------------------------------------------------- #
site.community_list.each do |c|
  puts "1> #{c.name}"
  c.collections.each do |coll|
    puts "1> COLL: #{coll.name}"
  end

  c.sub_communities.each do |cc|
    puts "-- 2> #{cc.name}"
    cc.collections.each do |coll|
      puts "-- 2> COLL: #{coll.name}"
    end

    cc.sub_communities.each do |ccc|
      puts "---- 3> #{ccc.name}"
      ccc.collections.each do |coll|
        puts "---- 3> COLL: #{coll.name}"
      end

      ccc.sub_communities.each do |cccc|
        puts "------ 4> #{cccc.name}"
        cccc.collections.each do |coll|
          puts "------ 4> COLL: #{coll.name}"
        end
      end
    end
  end
end
# ------------------------------------------------------- #
