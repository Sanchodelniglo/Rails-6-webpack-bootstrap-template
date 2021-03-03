const questions = document.querySelectorAll('.questions')


let displayIndex = 0

questions.forEach((question, index) => {
  const timer = setTimeout(() => {
    question.classList.remove('d-none')
    const answers = question.querySelectorAll('.answers');

    answers.forEach(function(answer) {
      const id = answer.dataset.answerId;
      const url = `/answers/${id}`;
      answer.addEventListener('click', function() {
        checkAnswer(url);
        displayIndex += 1
        question.classList.add('d-none');
        clearTimeout(timer);
      });
    });

  }, index * 5000);
});


function checkAnswer(url) {
  fetch(url)
  .then(response => response.json())
  .then((data) => {
    console.log(data);
  });
}

