puts 'Deleting models ...'

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
