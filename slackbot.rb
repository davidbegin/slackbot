require 'faker'

class Hey
  class << self
    def channel
      "#vim"
    end

    def response1(key, name)
      `curl -X POST --data-urlencode 'payload={"channel": "#{channel}", "username": "#{name}", "text": "#{Faker::Company.catch_phrase} is the right solution!", "icon_emoji": ":#{key}:"}' #{url}`
    end

    def response2(key, name)
      `curl -X POST --data-urlencode 'payload={"channel": "#{channel}", "username": "#{name}", "text": "Looking for a good time, call #{Faker::PhoneNumber.cell_phone}", "icon_emoji": ":#{key}:"}' #{url}`
    end

    def response3(key, name)
      `curl -X POST --data-urlencode 'payload={"channel": "#{channel}", "username": "#{name}", "text": "Hey YOU what are you doing with that computer", "icon_emoji": ":#{key}:"}' #{url}`
    end

    def response4(key, name)
      `curl -X POST --data-urlencode 'payload={"channel": "#{channel}", "username": "#{name}", "text": "#{Faker::Lorem.paragraph}", "icon_emoji": ":#{key}:"}' #{url}`
    end

    def response5(key, name)

      `curl -X POST --data-urlencode 'payload={"channel": "#{channel}", "username": "#{name}", "text": "ALL HANDS MEETING 12804 for conference", "icon_emoji": ":#{key}:"}' #{url}`
    end
  end
end

1.times do
  [
    :neckbeard,
    :no_good,
    :hurtrealbad,
    :whale,
    :space_invader,
    :horse_racing,
    :bowtie,
    :stuck_out_tongue_winking_eye,
    :goberserk,
    :squirrel,
    :octopus,
    :sun_with_face,
    :boar,
    :eyes,
    :dragon_face,
    :neutral_face,
    :shit,
    :smiling_imp,
    :lips,
    :koala,
    :girl,
    :muscle,
    :dizzy_face,
    :bride_with_veil,
    :pray,
    :man,
    :speak_no_evil,
    :trollface,
    :ghost,
    :dolls,
    :octocat,
    :fish,
    :cop,
    :flushed,
    :rocket,
    :honey_pot,
    :panda_face
  ].shuffle.each do |key|
    name = Faker::Name.name

    [
      # Proc.new { Hey.send(:response1, key, name) },
      # Proc.new { Hey.send(:response2, key, name) },
      # Proc.new { Hey.send(:response3, key, name) },
      # Proc.new { Hey.send(:response4, key, name) }
      Proc.new { Hey.send(:response5, key, name) }
    ].sample.call
  end

  def url
    "http://www.google.com"
  end
end

