puts 'Deleting models ...'

Invitation.destroy_all
UserChallenge.destroy_all
UserChallengeQuestion.destroy_all
ChallengeQuestion.destroy_all
Question.destroy_all
User.destroy_all

puts 'Adding models ...'

User.create!(first_name: 'romain', last_name: 'grossard', pseudo: 'sancho', email: 'tamere@gmail.com', password: 'secret')

question = Question.create!(prompt: 'Que veulent dire les chiffres au fond des verres de cantine ?')
question.answers.create!(
  [
    { assertion: 'C’est l’âge que vous avez et le plus jeune va chercher l’eau.' },
    { assertion: 'C’est la note que vous aurez à l’interro de cet après-midi.' },
    { assertion: 'C’est le nombre de filles avec qui vous sortirez dans la vie.' },
    { assertion: 'On sait pas, ça reste un mystère mais on est tous sur le coup…', correct: true }
  ]
)

question = Question.create!(prompt: "Si on avait persuadé Elvis Presley et Bob Marley de s'accoupler, on aurait pu obtenir :")
question.answers.create!(
  [
    { assertion: 'Elvis Marley, le rasta king.' },
    { assertion: 'Une baleine blanche avec des dreads.' },
    { assertion: 'Des tubes comme « Spliff me tender » ou « Could you be cruel »' },
    { assertion: 'Oui mais alors on dit n’importe quoi et toutes les réponses sont possibles.', correct: true }
  ]
)

question = Question.create!(prompt: 'Selon la légende, pourquoi la ligne ferroviaire Moscou - St Petersbourg fait-elle un détour de 17km ?')
question.answers.create!(
  [
    { assertion: 'Parce que les ouvriers étaient bourrés.' },
    { assertion: 'Parce que le froid a tordu les rails.' },
    { assertion: 'Parce que le Tsar avait laissé un doigt dépasser de sa règle.', correct: true },
    { assertion: 'Parce qu’avant il y avait un village qui a disparu depuis.' }
  ]
)

question = Question.create!(prompt: 'Quand la série "Derrick" s’est arrêtée, son scénariste avait :')
question.answers.create!(
  [
    { assertion: '74 ans' },
    { assertion: '84 ans' },
    { assertion: '94 ans', correct: true },
    { assertion: 'Honte' }
  ]
)

question = Question.create!(prompt: 'Parmi ces 4 voitures, laquelle a vraiment existé ?')
question.answers.create!(
  [
    { assertion: 'La Skoda « Tapina »' },
    { assertion: 'La Nissan « Gigolo »' },
    { assertion: 'La Mazda « Laputa »', correct: true },
    { assertion: 'La Fiat « 500 l’amour et 200 la p*** »' }
  ]
)

question = Question.create!(prompt: 'Qui a inventé la T.N.T ?')
question.answers.create!(
  [
    { assertion: 'Théodore Nathaniel Tarpé' },
    { assertion: 'Alfred Nobel', correct: true },
    { assertion: 'Théodore Nobel' },
    { assertion: 'Obi Wan Kenobi' }
  ]
)

question = Question.create!(prompt: 'Quelle est la capitale du Honduras ?')
question.answers.create!(
  [
    { assertion: 'Tegucilgapa' },
    { assertion: 'Tenochtitlan' },
    { assertion: 'Teglucidepapa' },
    { assertion: 'Tegucigalpa', correct: true }
  ]
)

question = Question.create!(prompt: "Eugène Poubelle n'a pas inventé la poubelle")
question.answers.create!(
  [
    { assertion: 'Vrai' },
    { assertion: 'Faux', correct: true }
  ]
)

question = Question.create!(prompt: "Qui a dit 'un petit pas pour l'homme, un grand pas pour l'humanité' ?")
question.answers.create!(
  [
    { assertion: 'Neil Armstrong', correct: true },
    { assertion: 'Lance Armstrong' },
    { assertion: 'Louis Armstrong' },
    { assertion: 'Jannie Longo' }
  ]
)

question = Question.create!(prompt: "En navigation, que signifie 'prendre un ris' ?")
question.answers.create!(
  [
    { assertion: 'Manger un bon bol de riz' },
    { assertion: 'Diminuer la taille de la grand voile', correct: true },
    { assertion: 'Attraper un gros poisson en pêchant à la traîne' },
    { assertion: 'Raconter un bonne blague' }
  ]
)

question = Question.create!(prompt: "Il n'y a pas de petits ...")
question.answers.create!(
  [
    { assertion: 'Profiles' },
    { assertion: 'Trop petits' },
    { assertion: 'Profits', correct: true },
    { assertion: 'Pros Frit' }
  ]
)

question = Question.create!(prompt: "L'inventeur du Sandwich est :")
question.answers.create!(
  [
    { assertion: "Johnny Sandwich, deuxième d'une fratrie de trois" },
    { assertion: "Agatha Sandi Which, Première Dame de l'Inde dans les années 20" },
    { assertion: 'Un mec qui aimait le pain, le beurre et le jambon' },
    { assertion: 'John Montagu, quatrième comte de Sandwich', correct: true }
  ]
)

question = Question.create!(prompt: "La femelle du lièvre est :")
question.answers.create!(
  [
    { assertion: "La livrette" },
    { assertion: "La laie" },
    { assertion: 'La lievremont' },
    { assertion: 'La Hase', correct: true }
  ]
)

question = Question.create!(prompt: "Trouver la bonne réponse :")
question.answers.create!(
  [
    { assertion: "A, la réponse A" },
    { assertion: "B, la réponse B" },
    { assertion: "C, la réponse C" },
    { assertion: 'A, B, C et donc D', correct: true }
  ]
)

question = Question.create!(prompt: "Le framework Ruby on Rails a été crée par :")
question.answers.create!(
  [
    { assertion: "DHT" },
    { assertion: "DDT" },
    { assertion: "Erreur" },
    { assertion: 'DHH', correct: true }
  ]
)
