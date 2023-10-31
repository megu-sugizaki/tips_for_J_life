# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

########################### 管理者

Admin.create!(
  email: 'admin@admin',
  encrypted_password: 'adminmin',
  password: 'adminmin',
  password_confirmation: 'adminmin',
)

########################### Settings
# number of user（Bobby Harrison）
bobby_harrison_num = 15
# number of user（Lluvia Ocampo）
lluvia_ocampo_num = 15
# number of user（Han Rue）
han_rue_num = 15
########################### 

########################### User（Bobby Harrison）

bobby_harrison_num.times do |num|
  num += 1
  User.create!(
    last_name: "Harrison",
    first_name: "Bobby#{num}",
    email: "bobby@harrison#{num}",
    encrypted_password: 'lostintranslation',
    password: 'lostintranslation',
    password_confirmation: 'lostintranslation',
    is_active: true
  )
  profile_image.attach(io: File.open(Rails.root.join("app/assets/images/users/img-#{User.all.count}.jpg")), filename: "img-#{User.all.count}.jpg")
    
end

########################### User（Alice Paraguas）

lluvia_ocampo_num.times do |num|
  num += 1
  User.create!(
    last_name: "Ocampo",
    middle_name: "R.N",
    first_name: "Lluvia#{num}",
    email: "lluvia@ocampo#{num}",
    encrypted_password: 'raccooncity',
    password: 'raccooncity',
    password_confirmation: 'raccooncity',
    is_active: true
  )
  profile_image.attach(io: File.open(Rails.root.join("app/assets/images/users/img-#{User.all.count}.jpg")), filename: "img-#{User.all.count}.jpg")
    
end

########################### User（han Rue）

han_rue_num.times do |num|
  num += 1 
  User.create!(
    last_name: "rue",
    first_name: "han#{num}",
    email: "han@rue#{num}",
    encrypted_password: 'tokyodrift',
    password: 'tokyodrift',
    password_confirmation: 'tokyodrift',
    is_active: true
  )
  profile_image.attach(io: File.open(Rails.root.join("app/assets/images/users/img-#{User.all.count}.jpg")), filename: "img-#{User.all.count}.jpg")
end

########################### Bobby Harrison Problem
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
      user_id: rand(0..14),
      title: "I need help for #{problem}",
      caption: "I don't know how to #{problem}. Would you give me some advice?",
      is_active: true
    )
    problem_image.attach(io: File.open(Rails.root.join("app/assets/images/bh_problems/img-#{Problem.all.count}.jpg")), filename: "img-#{Problem.all.count}.jpg")
  end

########################### Lluvia Ocampo Problem
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
    'buscar un diafraz de zombi',
    'disfrutarme en Shibuya en lluvia',
    'find some grupo para jugar juegos juntos',
    'buscar lección de aikido',
    'buscar lección de judo'
]

  lo_problems_array.each do |problem|
    problem = Problem.create!(
      user_id: rand(15..29),
      title: "Necesito ayuda por #{problem}",
      caption: "No sé cómo #{problem}. Me pasarías unas informaciones?",
      is_active: true
    )
    # 画像を登録
    problem_image.attach(io: File.open(Rails.root.join("app/assets/images/lo_problems/img-#{Problem.all.count}.jpg")), filename: "img-#{Problem.all.count}.jpg")
  end

########################### Han Lue
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
      user_id: rand(30..44),
      title: "#{problem}について",
      caption: "#{problem}がしたいです。どうしたらいいですか？おしえてください。",
      is_active: true
    )
    # 画像を登録
    problem_image.attach(io: File.open(Rails.root.join("app/assets/images/hr_problems/img-#{Problem.all.count}.jpg")), filename: "img-#{Problem.all.count}.jpg")
  end

########################### Problem comment English
ProblemComment.create!(
      problem_id: rand(0..14),
      user_id: rand(0..14),
      comment: "Can you be more specific？I'll help you more if you could.",
    )
########################### Problem comment Spanish  
ProblemComment.create!(
  problem_id: rand(15..29),
  user_id: rand(15..29),
  comment: "Eso sería más específico？Te puedo ayudar más si puedes darme más informaciones.",
)

########################### Problem comment easy Japanese
ProblemComment.create!(
      problem_id: rand(30..44),
      user_id: rand(30..44),
      comment: "もっと、こまかく おしえてくれますか？おうえんしています",
    )
    
########################### Problem tag
problem_tags_array = [
    'life',
    'leisure/hobby',
    'health',
    'language',
]

problem_tags_array.each do |problem_tag|
    problem_tag = ProblemTag.create!(
      name: problem_tag,
    )
end

########################### Problem tag
AssociationProblemTag.create!(
  problem_id: rand(0..44),
  problem_tag_id: rand(0..3)
)
    
########################### Event
# events_array = [
#     'takoyaki',
#     'okonomiyaki',
#     'momiji',
#     'tanabata',
# ]

# events_array.each do |event|
# Event.create!(
#   user_id: rand(0..44),
#   owner_id: rand(0..44),
#   title: event,
#   caption: "Let's enjoy #{event} together!"
# )
# end