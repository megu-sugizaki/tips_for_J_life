# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

########################### M:Admin
Admin.create!(
  email: 'admin@admin',
  encrypted_password: 'adminmin',
  password: 'adminmin',
  password_confirmation: 'adminmin',
)

########################### M:Settings
# number of user（Bobby Harrison）
bobby_harrison_num = 10
# number of user（Lluvia Ocampo）
lluvia_ocampo_num = 10
# number of user（Han Rue）
han_rue_num = 10
########################### 

########################### M:User（Bobby Harrison）
bobby_harrison_num.times do |num|
  num += 1
  user = User.create!(
    last_name: "Harrison",
    first_name: "Bobby#{num}",
    email: "bobby@harrison#{num}",
    encrypted_password: 'lostintranslation',
    password: 'lostintranslation',
    password_confirmation: 'lostintranslation',
    is_active: true
  )
  user.profile_image.attach(io: File.open(Rails.root.join("app/assets/images/profile_image/bh/img-#{user.id}.jpg")), filename: "img-#{user.id}.jpg")
    
end

########################### M:User（Alice Paraguas）
lluvia_ocampo_num.times do |num|
  num += 1
  user = User.create!(
    last_name: "Ocampo",
    middle_name: "R.N",
    first_name: "Lluvia#{num}",
    email: "lluvia@ocampo#{num}",
    encrypted_password: 'raccooncity',
    password: 'raccooncity',
    password_confirmation: 'raccooncity',
    is_active: true
  )
  user.profile_image.attach(io: File.open(Rails.root.join("app/assets/images/profile_image/lo/img-#{user.id}.jpg")), filename: "img-#{user.id}.jpg")
end

########################### M:User（han Rue）
han_rue_num.times do |num|
  num += 1 
  user = User.create!(
    last_name: "rue",
    first_name: "han#{num}",
    email: "han@rue#{num}",
    encrypted_password: 'tokyodrift',
    password: 'tokyodrift',
    password_confirmation: 'tokyodrift',
    is_active: true
  )
  user.profile_image.attach(io: File.open(Rails.root.join("app/assets/images/profile_image/hr/img-#{user.id}.jpg")), filename: "img-#{user.id}.jpg")
end

########################### M:Guest User info
user = User.create!(
    last_name: "!",
    first_name: "guestuser",
    email: "guest@example.com",
    encrypted_password: SecureRandom.urlsafe_base64,
    password: SecureRandom.urlsafe_base64,
    is_active: true
  )

########################### M:Bobby Harrison Problem
bh_problems_array = [
    'learn Japanese language',
    'find a good app to translate all sushi place',
    'put subtitles for morning news',
    'deal with J company culture',
    'find a hospital for apendicitis',
    'find a good dating spot in Tokyo',
    'join some volunteering groups',
    'cook ramen',
    'ride on a bus',
    'renew my passport',
    'order sushi in J',
    'study Japanese',
    'register  to take JLPT',
    'know if the sea allows me to fish',
    'recover from lost in translation'
]

  bh_problems_array.each do |problem|
    problem = Problem.create!(
      user_id: rand(1..10),
      title: "Help! I want to #{problem}",
      caption: "I don't know how to #{problem}. Would you give me some advice?"
    )
    problem.problem_images.attach(io: File.open(Rails.root.join("app/assets/images/bh_problems/img-#{problem.id}.jpg")), filename: "img-#{problem.id}.jpg")
  end

########################### M:Lluvia Ocampo Problem
lo_problems_array = [
    'buscar zoologico con mapache',
    'buscar lección de karate',
    'buscar un lugar para jugar un juego apocalíptico',
    'manejar mi deseo de regresar a la ciudad de mapache',
    'buscar un hospital para coser la cicatriz en mi cara',
    'vacunar mis perritos',
    'hacer camping',
    'donar mi sangre',
    'chequear si estoy infectada o no',
    'buscar un buena compañera para jugar R.E.',
    'buscar un disfraz de zombi',
    'disfrutarme en Shibuya en lluvia',
    'buscar un grupo para jugar juegos juntos',
    'buscar lección de aikido',
    'buscar lección de judo'
]

  lo_problems_array.each do |problem|
    problem = Problem.create!(
      user_id: rand(11..20),
      title: "Necesito ayuda por #{problem}",
      caption: "No sé cómo #{problem}. Me pasarías unas informaciones?"
    )
    problem.problem_images.attach(io: File.open(Rails.root.join("app/assets/images/lo_problems/img-#{problem.id}.jpg")), filename: "img-#{problem.id}.jpg")
  end

########################### M:Han Lue
hr_problems_array = [
    'めんきょのきりかえ',
    'ゴーカート',
    '車けん',
    'タイヤのこうかん',
    '車のとそう',
    '車のキズのしゅうり',
    'かいがんでドライブ',
    '車のしゅうり',
    'オイルのこうかん',
    'F1のかんせん',
    '車のえいがかんしょう',
    'こうそくどうろでドライブ',
    'バッテリーのこうかん',
    'せんじょうえきのこうかん',
    'うんてんめんきょしゅとく'
]

  hr_problems_array.each do |problem|
    problem = Problem.create!(
      user_id: rand(21..30),
      title: "#{problem}についてこまっています",
      caption: "#{problem}がしたいです。どうしたらいいですか？おしえてください。"
    )
    problem.problem_images.attach(io: File.open(Rails.root.join("app/assets/images/hr_problems/img-#{problem.id}.jpg")), filename: "img-#{problem.id}.jpg")
  end

########################### M:Problem comment English

ProblemComment.create!(
      user_id: rand(1..10),
      problem_id: rand(1..15),
      comment: "Can you be more specific？I'll help you more if you could.",
    )
########################### M:Problem comment Spanish  
ProblemComment.create!(
  user_id: rand(11..20),
  problem_id: rand(16..30),
  comment: "Eso sería más específico？Te puedo ayudar más si puedes darme más informaciones.",
)

########################### M:Problem comment easy Japanese
ProblemComment.create!(
      user_id: rand(21..30),
      problem_id: rand(31..45),
      comment: "もっと、こまかく おしえてくれますか？おうえんしています",
    )
    
########################### M:Problem tag
problem_tags_array = [
    'life',
    'leisure/hobby',
    'health',
    'language',
]

problem_tags_array.each do |problem_tag|
    problem_tag = ProblemTag.create!(
    name: problem_tag,
    user_id: rand(1..30)
    )
end

########################### M:Problem tag
AssociationProblemTag.create!(
  problem_id: rand(1..30),
  problem_tag_id: rand(1..4)
)
    
########################### M:Event
events_array = [
    'takoyaki party',
    'momiji hunting',
    'join sports day',
    'hanami',
    'language club',
]

events_array.each do |event|
  event = Event.create!(
    user_id: rand(1..30),
    owner_id: rand(1..30),
    title: "Let's go #{event}",
    caption: "We would like to gather people to go #{event}. Come join and we'll have fun together!"
  )
end

########################### M:Notice
notices_array = [
    'an earthquake',
    'immigration rule change',
    'typhoon',
    'flood',
    'movie extra recruit',
]

notices_array.each do |notice|
  notice = Notice.create!(
    title: "About #{notice}",
    detail: "We got a news about #{notice}. We will keep you updated about it. Do not miss the latest update! Contact if you have any concerns."
  )
end