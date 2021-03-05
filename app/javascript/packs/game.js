const questions = document.querySelectorAll('.question-card')

displayIndex = 0

questions.forEach((question, index) => {


  question.classList.remove('d-none');

  const answers = question.querySelectorAll('.answers');

  answers.forEach(function(answer) {
    const answerId = answer.dataset.answerId;
    const ucId = answer.dataset.userChallengeId
    const url = `/answers/${answerId}?user_challenge_id=${ucId}`;
    answer.addEventListener('click', function() {
      checkAnswer(url);
      displayIndex += 1
      question.classList.add('d-none');

      if (displayIndex == questions.length) {
        const challengeId = answer.dataset.challengeId

        window.location.href = `/challenges/${challengeId}`
      }
    });
  });

});

console.log(displayIndex)

function checkAnswer(url) {
  fetch(url)
  .then(response => response.json())
  .then((data) => {
    console.log(data);
  });
}

